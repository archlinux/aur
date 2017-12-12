# Maintainer: travisghansen <travisghansen@yahoo.com>

pkgname=yubico-piv-tool
pkgver=1.4.4
pkgrel=3
pkgdesc="Tool to interact with the PIV applet on a YubiKey NEO"
arch=('armv7h' 'i686' 'x86_64')
license=('GPL3')
depends=('pcsclite' 'openssl-1.0')
# prep for 1.5.x
#makedepends=('check')
#checkdepends=('check')
url=https://developers.yubico.com/yubico-piv-tool/
source=(
 "https://developers.yubico.com/yubico-piv-tool/Releases/${pkgname}-${pkgver}.tar.gz"
 "https://developers.yubico.com/yubico-piv-tool/Releases/${pkgname}-${pkgver}.tar.gz.sig"
)
md5sums=('bdada97514316bd7d712f8dfc6ee6a5e'
         'SKIP')
validpgpkeys=('0A3B0262BCA1705307D5FF06BCA00FD4B2168C0A' '268583B64786F50F807456DA8CED3A80D41C0DCB')
options=(!libtool)

build() {
  cd "${pkgname}-${pkgver}"
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" make install
}
