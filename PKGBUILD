# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jens John <dev@2ion.de>

pkgname=advancecomp
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
pkgver=2.3
pkgrel=1
arch=(x86_64)
url="https://github.com/amadvance/${pkgname}"
license=(GPL3)
depends=(gcc-libs zlib)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('87dc6a25139708b975ff138f73555fb2053c0fb8310412823624de7786a2034657fc3b4ddb6eeda332788073bbe21ea955b7368707186ee3bb61d1fe59e672e3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
