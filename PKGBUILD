# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=libclassicclient
pkgver=7.0.0_b08
pkgrel=1
pkgdesc="Gemalto & LuxTrust PKCS#11 middleware"
url="https://www.luxtrust.lu/en/simple/225"
arch=(i686 x86_64)
depends=(
  gcc-libs
  gdk-pixbuf2
  gtk2
  libusb-compat
  openssl
  pcsclite
)
source_i686=("https://nullroute.eu.org/tmp/2017/LuxTrust_Middleware_Ubuntu_32bit_7.0.0-b08.deb")
source_x86_64=("https://nullroute.eu.org/tmp/2017/LuxTrust_Middleware_Ubuntu_64bit_7.0.0-b08.deb")
sha256sums_i686=('543dc4288491e753f0b04f5a19b28fbf0952dfbdb6fa822442b6dced1ac9a949')
sha256sums_x86_64=('e3e898bb6ff4e4da07b69231f2ad618b412aabd8be2ef94115a2f9d50aef84d9')

prepare() {
  cd "$srcdir"

  bsdtar xf data.tar.xz
}

package() {
  cd "$srcdir"

  cp -a etc usr "$pkgdir/"

  cd "$pkgdir"

  chmod a-x etc/udev/rules.d/*
  chmod a+x usr/lib/**/*.so

  mkdir -p usr/lib/udev/rules.d
  mv etc/udev/rules.d/* usr/lib/udev/rules.d/

  mkdir -p usr/share/p11-kit/modules
  echo "module: libgclib.so" > usr/share/p11-kit/modules/$pkgname.module
}

# vim: ft=sh:ts=2:sw=2:et:nowrap
