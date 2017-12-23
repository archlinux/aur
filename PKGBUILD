# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Robert Schwarz <mail@rschwarz.net>

pkgname=geosteiner
pkgver=5.1
pkgrel=1
pkgdesc="Compute Euclidean and Rectilinear Steiner Trees"
arch=(i686 x86_64)
url="http://www.geosteiner.com/"
license=(custom)
source=("http://www.geosteiner.com/geosteiner-${pkgver}.tar.gz"
        '0001-Makefile-noerror.patch')
sha256sums=('e8dc390d7a2bb1cfbae050fb5c712a8fcf128a2ea0ec5cc7377e6f904878d9ee'
            'ee4ec6ca5fc77c7fce1303a6d0fe8b9382118e11bbd8992bd10932a2f790300c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr"
  patch -p1 < ../0001-Makefile-noerror.patch
  make

  sed -i '' "${srcdir}/${pkgname}-${pkgver}/${pkgname}_config"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -c -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
