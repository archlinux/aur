# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Xpander <xpander0@gmail.com>
# Contributor: Stefan Achatz <erazor_de@users.soruceforge.net>
# Contributor: Zachary Lund <admin@computerquip.com>

pkgname=('roccat-tools-common'
         'roccat-tools-arvo'
         'roccat-tools-isku'
         'roccat-tools-iskufx'
         'roccat-tools-kone'
         'roccat-tools-koneplus'
         'roccat-tools-konepure'
         'roccat-tools-konepuremilitary'
         'roccat-tools-konepureoptical'
         'roccat-tools-konextd'
         'roccat-tools-konextdoptical'
         'roccat-tools-kovaplus'
         'roccat-tools-lua'
         'roccat-tools-pyra'
         'roccat-tools-ryosmk'
         'roccat-tools-ryostkl'
         'roccat-tools-savu'
         'roccat-tools-tyon')
pkgbase=roccat-tools
pkgver=3.4.0
pkgrel=2
pkgdesc='Userland applications to configure and make extended use of ROCCAT devices'
arch=('i686' 'x86_64')
url='http://roccat.sourceforge.net'
license=('GPL2')
depends=('libgaminggear=0.9.0' 'libcanberra' 'gtk2' 'libnotify>=0.7.0' 'dbus-glib' 'udev' 'hicolor-icon-theme')
makedepends=('cmake')
optdepends=('kmod-roccat: Adds support for the old kone device.')
conflicts=
source=("http://downloads.sourceforge.net/project/roccat/roccat-tools/roccat-tools-$pkgver.tar.bz2"
        'udev-compilation-error-fix.patch')

md5sums=('3450bb0fb771f33d159ffff7a4860ab6'
         '414d6306796c659a3adc86ef213e3569')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  # See here for more detail and progress on this:
  # https://sourceforge.net/p/roccat/bugs/51/
  patch -p1 -i ../udev-compilation-error-fix.patch

  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DUDEVDIR=/usr/lib/udev/rules.d \
	-DWITHOUT_PYTHON=TRUE \
	-DLIBDIR="/usr/lib"
  make
}

package_roccat-tools-common() {
  pkgdesc='ROCCAT tools common files'
install=roccat-tools.install

  for i in icons sounds libroccat libroccathelper libroccatwidget roccateventhandler; do
    cd $srcdir/$pkgbase-$pkgver/$i
    make DESTDIR="$pkgdir/" install
  done
}

package_roccat-tools-arvo() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Arvo devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/arvo"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-arvo.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-arvo.rules
}

package_roccat-tools-isku() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Isku devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/isku"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-isku.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-isku.rules
}

package_roccat-tools-iskufx() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Isku FX devices'
  depends=('roccat-tools-common' 'roccat-tools-isku')

  cd "$srcdir/$pkgbase-$pkgver/iskufx"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-iskufx.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-iskufx.rules
}

package_roccat-tools-kone() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/kone"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-kone.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-kone.rules
}

package_roccat-tools-koneplus() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone[+] devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/koneplus"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-koneplus.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-koneplus.rules
}

package_roccat-tools-konepure() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone Pure devices'
  depends=('roccat-tools-common' 'roccat-tools-konextd')

  cd "$srcdir/$pkgbase-$pkgver/konepure"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konepure.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepure.rules
}

package_roccat-tools-konepureoptical() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone Pure optical devices'
  depends=('roccat-tools-common' 'roccat-tools-konepure')

  cd "$srcdir/$pkgbase-$pkgver/konepureoptical"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konepureoptical.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepureoptical.rules
}

package_roccat-tools-konepuremilitary() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone Pure Military devices'
  depends=('roccat-tools-common' 'roccat-tools-konepure')

  cd "$srcdir/$pkgbase-$pkgver/konepuremilitary"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konepuremilitary.rules
}

package_roccat-tools-konextd() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone XTD devices'
  depends=('roccat-tools-common' 'roccat-tools-koneplus')

  cd "$srcdir/$pkgbase-$pkgver/konextd"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-konextd.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konextd.rules
}

package_roccat-tools-konextdoptical() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kone XTD Optical devices'
  depends=('roccat-tools-common' 'roccat-tools-konepuremilitary')

  cd "$srcdir/$pkgbase-$pkgver/konextdoptical"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-konextdoptical.rules
}

package_roccat-tools-kovaplus() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Kova[+] devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/kovaplus"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-kovaplus.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-kovaplus.rules
}

package_roccat-tools-lua() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Lua devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/lua"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-lua.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-lua.rules
}

package_roccat-tools-pyra() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Pyra devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/pyra"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-pyra.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-pyra.rules
}

package_roccat-tools-ryosmk() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT RyosMK devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/ryosmk"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-ryosmk.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-ryosmk.rules
}

package_roccat-tools-ryostkl() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT RyosTKL devices'
  depends=('roccat-tools-common' 'roccat-tools-ryosmk')

  cd "$srcdir/$pkgbase-$pkgver/ryostkl"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-ryostkl.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-ryostkl.rules
}

package_roccat-tools-savu() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Savu devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/savu"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-savu.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-savu.rules
}

package_roccat-tools-tyon() {
  pkgdesc='Userland applications to configure and make extended use of ROCCAT Tyon devices'
  depends=('roccat-tools-common')

  cd "$srcdir/$pkgbase-$pkgver/tyon"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 udev/90-roccat-tyon.rules $pkgdir/usr/lib/udev/rules.d/90-roccat-tyon.rules
}
