# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=zzuf
pkgver=0.15
pkgrel=1
pkgdesc="Transparent application input fuzzer"
url='https://github.com/samhocevar/zzuf'
arch=('i686' 'x86_64')
license=('custom:WTF')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/samhocevar/zzuf/archive/v${pkgver}.tar.gz)
sha512sums=('7eb67b3531ceec68ec9cac2d3c7f5212dcf63a3bd706bd9d40e9b7f762e8f0e225606a9de4e13826ce20d0e385205720dcc40a5745f52eede67ffe2a8c9e5a20')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
