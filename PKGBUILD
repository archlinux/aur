# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=libbigwig
pkgver=0.4.4
pkgrel=1
pkgdesc="library for handling bigWig files"
arch=('i686' 'x86_64')
url="https://github.com/dpryan79/libBigWig"
depends=('curl')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpryan79/libBigWig/archive/${pkgver}.tar.gz"
        "libbigwig-flags.patch")
sha256sums=('43a2298b2ebadc48103447a3bb4426df1b38d1bec5fa564e50ed2f00cc060478'
            '33be8bbc296c3ff022063d9907ad8975033cd47a5d91b052290507d531abd530')

prepare() {
  cd "${srcdir}/libBigWig-${pkgver}"
  patch -Np1 -i "${srcdir}/libbigwig-flags.patch"
}

build() {
  cd "${srcdir}/libBigWig-${pkgver}"
  make
}

package() {
  cd "${srcdir}/libBigWig-${pkgver}"
  make prefix=${pkgdir}/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
