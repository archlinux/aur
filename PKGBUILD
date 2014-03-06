# Maintainer: Aaron Mueller <mail@aaron-mueller.de>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Xpander <xpander0@gmail.com>
# Contributor: erazor <erazor_de@users.soruceforge.net>

pkgname=roccat-tools

# To trick the AUR package parser (on the website), we need to "cover" the pkgname
# list with the "true &&" hack. This way, the package will be displayed as
# "roccat-tools" on the website.
true && pkgname=('roccat-tools-common'
                 'roccat-tools-arvo'
                 'roccat-tools-isku'
                 'roccat-tools-iskufx'
                 'roccat-tools-kone'
                 'roccat-tools-koneplus'
                 'roccat-tools-konepure'
                 'roccat-tools-konepureoptical'
                 'roccat-tools-konextd'
                 'roccat-tools-kovaplus'
                 'roccat-tools-lua'
                 'roccat-tools-pyra'
                 'roccat-tools-ryos'
                 'roccat-tools-savu')
pkgbase=roccat-tools
pkgver=1.4.1
pkgrel=2
pkgdesc="Userland applications to configure and make extended use of ROCCAT devices"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net"
license=('GPL2')
depends=('libcanberra' 'gtk2' 'libnotify>=0.7.0' 'libusb' 'dbus-glib' 'udev' 'hicolor-icon-theme')
makedepends=('cmake')
optdepends=('kmod-roccat: Adds support for some devices not yet in vanilla kernel')
conflicts=(kone koneplus pyra roccat)
source=("http://downloads.sourceforge.net/project/roccat/roccat-tools/roccat-tools-$pkgver.tar.bz2")

md5sums=('5edc1c936cef38c3a24de0676643010b')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUDEVDIR=/usr/lib/udev/rules.d
  make
}

package_roccat-tools-common() {
  true && pkgdesc="ROCCAT tools common files"
install=roccat-tools.install
  true && conflicts=('roccat-tools')

  for i in icons sounds libroccat libroccathelper libroccatwidget roccateventhandler; do
    cd $srcdir/$pkgbase-$pkgver/$i
    make DESTDIR="$pkgdir/" install
  done
}

package_roccat-tools-arvo() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Arvo devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/arvo"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-arvo.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-arvo.rules
}

package_roccat-tools-isku() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Isku devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/isku"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-isku.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-isku.rules
}

package_roccat-tools-iskufx() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Isku FX devices"
  true && depends=('roccat-tools-common' 'isku')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/iskufx"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-iskufx.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-iskufx.rules
}

package_roccat-tools-kone() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Kone devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/kone"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-kone.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-kone.rules
}

package_roccat-tools-koneplus() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Kone[+] devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/koneplus"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-koneplus.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-koneplus.rules
}

package_roccat-tools-konepure() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Kone Pure devices"
  true && depends=('roccat-tools-common' 'konextd')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/konepure"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konepure.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepure.rules
}

package_roccat-tools-konepureoptical() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Kone Pure optical devices"
  true && depends=('roccat-tools-common' 'konepure')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/konepureoptical"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konepureoptical.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepureoptical.rules
}

package_roccat-tools-konextd() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Kone XTD devices"
  true && depends=('roccat-tools-common' 'koneplus')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/konextd"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konextd.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konextd.rules
}

package_roccat-tools-kovaplus() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Kova[+] devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/kovaplus"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-kovaplus.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-kovaplus.rules
}

package_roccat-tools-lua() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Lua devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/lua"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-lua.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-lua.rules
}

package_roccat-tools-pyra() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Pyra devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/pyra"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-pyra.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-pyra.rules
}

package_roccat-tools-ryos() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Ryos devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/ryos"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-ryos.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-ryos.rules
}

package_roccat-tools-savu() {
  true && pkgdesc="Userland applications to configure and make extended use of ROCCAT Savu devices"
  true && depends=('roccat-tools-common')
  true && conflicts=('roccat-tools')

  cd "$srcdir/$pkgbase-$pkgver/savu"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-savu.rules
}
