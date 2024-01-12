# Maintainer: c6p <can6parmak <AT> gmail <DOT> com>

pkgname=oofcanvas
pkgver='1.1.1'
pkgrel=1
pkgdesc="Replacement for libgnomecanvas, designed for use in OOF2."
arch=('i686' 'x86_64')
url="http://www.ctcms.nist.gov/oof/oof2/index.html"
license=('custom')
depends=('gtk3' 'pango' 'cairomm' 'python-gobject' 'libmagick6')
makedepends=('cmake>=3.18' 'swig>=4.0')
source=("https://www.ctcms.nist.gov/oof/oofcanvas/source/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('97dcadae650b22a41491242ae01e4226'
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
