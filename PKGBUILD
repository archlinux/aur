# Maintainer: c6parmak <can6parmak <AT> gmail <DOT> com>

pkgname=oof2
pkgver='2.3.2'
pkgrel=1
pkgdesc="Finite element analysis of microstructures."
arch=('i686' 'x86_64')
url="http://www.ctcms.nist.gov/oof/oof2/index.html"
license=('custom')
depends=('python' 'gtk3' 'python-gobject' 'oofcanvas' 'libmagick6' 'lapack')
makedepends=('cmake')
source=("https://www.ctcms.nist.gov/oof/oof2/source/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('a69cdd2c7fdcdc2c4311f4bfcd4cd985'
         'c1d808bd883c2e0a30b687e3fcec4847')

build() {
  cd "${pkgname}-${pkgver}"
  export PKG_CONFIG_PATH=/usr/lib/imagemagick6/pkgconfig
  cmake -B build -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -Wno-dev
  cmake --build build
}

package() {
  cmake --install "${pkgname}-${pkgver}/build" --prefix="$pkgdir/usr"
  install -m 644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
