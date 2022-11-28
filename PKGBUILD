# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jens John <dev@2ion.de>

pkgname=advancecomp
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
pkgver=2.4
pkgrel=1
arch=(x86_64 aarch64)
url="https://github.com/amadvance/${pkgname}"
license=(GPL3)
depends=(gcc-libs zlib)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('667e0e898208df578a676b6084ca6c8dae119a6006f716b1dfa29cd0ec5b022f7b5fd099d09c25e520bdf90bc5531a7e36ed120472ca732303b719818cc5b712')

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
