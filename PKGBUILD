# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang at googlemail dot com>

pkgname=libbigwig
pkgver=0.4.6
pkgrel=1
pkgdesc="library for handling bigWig files"
arch=('i686' 'x86_64')
url="https://github.com/dpryan79/libBigWig"
depends=('curl')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dpryan79/libBigWig/archive/${pkgver}.tar.gz"
        "libbigwig-flags.patch")
sha256sums=('eb4ecbd3ae428474a57dab969fa7564ae755310da65be68efa18969e0d132a9e'
            'f27db1d7169e8f28130791c6fa8fd33accb9696be5d541880f53b92719f32fb1')

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
