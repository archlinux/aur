# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jens John <dev@2ion.de>

pkgname=advancecomp
pkgdesc="Recompression utilities for .zip .png .mng and .gz files using the 7-zip algorithm"
pkgver=2.5
pkgrel=1
arch=(x86_64 aarch64)
url="https://github.com/amadvance/${pkgname}"
license=(GPL3)
depends=(gcc-libs zlib)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('3beb26e9afdafb62ab13c3c56902b71b5dabccfa458c9930bdfd0a835149c46bed22bfac7b529c341f241bb8f7670c4cda4c50fd34df31b9a3902f8b8b655049')

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
