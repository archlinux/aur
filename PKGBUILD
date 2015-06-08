# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Xpander <xpander0@gmail.com>
# Contributor: Stefan Achatz <erazor_de@users.soruceforge.net>

pkgname=('roccat-tools-full')
_pkgbase=roccat-tools
pkgver=3.2.0
pkgrel=1
pkgdesc='Userland applications to configure and make extended use of ROCCAT devices'
arch=('i686' 'x86_64')
url='http://roccat.sourceforge.net'
license=('GPL2')
depends=('libgaminggear>=0.7.0' 'libcanberra' 'gtk2' 'libnotify>=0.7.0' 'dbus-glib' 'udev' 'hicolor-icon-theme')
makedepends=('cmake')
optdepends=('kmod-roccat: Adds support for the old kone device.'
            'roccat-dkms: Adds support for the old kone device with dynamic rebuild.')
conflicts=('roccat-tools-common')
replaces=('roccat-tools-common')
source=("http://downloads.sourceforge.net/project/roccat/roccat-tools/roccat-tools-$pkgver.tar.bz2"
        'ryosmk-dbus-bindings-v320.patch')
install=roccat-tools.install
sha1sums=('f75c1068f773242b343df663d51707e6b0511afb'
          '56cde9cd4f1c296f5316b0d47b7d917c6819900f')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  patch -p1 -i ../ryosmk-dbus-bindings-v320.patch
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUDEVDIR=/usr/lib/udev/rules.d -DWITHOUT_PYTHON=TRUE
  make
}

package() {
  for i in icons sounds libroccat libroccathelper libroccatwidget roccateventhandler; do
    cd $srcdir/$_pkgbase-$pkgver/$i
    make DESTDIR="$pkgdir/" install
  done

  cd "$srcdir/$_pkgbase-$pkgver/arvo"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-arvo.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-arvo.rules

  cd "$srcdir/$_pkgbase-$pkgver/isku"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-isku.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-isku.rules

  cd "$srcdir/$_pkgbase-$pkgver/iskufx"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-iskufx.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-iskufx.rules

  cd "$srcdir/$_pkgbase-$pkgver/kone"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-kone.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-kone.rules

  cd "$srcdir/$_pkgbase-$pkgver/koneplus"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-koneplus.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-koneplus.rules

  cd "$srcdir/$_pkgbase-$pkgver/konepure"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konepure.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepure.rules

  cd "$srcdir/$_pkgbase-$pkgver/konepureoptical"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konepureoptical.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepureoptical.rules

  cd "$srcdir/$_pkgbase-$pkgver/konepuremilitary"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepuremilitary.rules

  cd "$srcdir/$_pkgbase-$pkgver/konextd"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konextd.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konextd.rules

  cd "$srcdir/$_pkgbase-$pkgver/konextdoptical"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konextdoptical.rules

  cd "$srcdir/$_pkgbase-$pkgver/kovaplus"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-kovaplus.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-kovaplus.rules

  cd "$srcdir/$_pkgbase-$pkgver/lua"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-lua.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-lua.rules

  cd "$srcdir/$_pkgbase-$pkgver/pyra"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-pyra.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-pyra.rules

  cd "$srcdir/$_pkgbase-$pkgver/ryosmk"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-ryosmk.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-ryosmk.rules

  cd "$srcdir/$_pkgbase-$pkgver/ryostkl"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-ryostkl.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-ryostkl.rules

  cd "$srcdir/$_pkgbase-$pkgver/savu"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-savu.rules

  cd "$srcdir/$_pkgbase-$pkgver/tyon"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$_pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-tyon.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-tyon.rules
}

# vim:set ts=2 sw=2 et:
