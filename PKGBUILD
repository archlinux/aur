# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=castxml
pkgdesc="C-family abstract syntax tree XML output tool."
pkgver=0.3.1
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/CastXML/CastXML"
license=(Apache)
depends=(llvm clang)
makedepends=(git cmake python-sphinx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/CastXML/CastXML/archive/v$pkgver.tar.gz")
sha256sums=('eccd8b086c05b3424e6582ff72c93b398fec3eb0e0855cdfef56cfcd952e47f5')

prepare() {
  cd "CastXML-$pkgver"

  cmake . \
    -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build \
    -DSPHINX_HTML=1 \
    -DSPHINX_MAN=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCastXML_INSTALL_DOC_DIR=share/doc/castxml \
    -DCastXML_INSTALL_MAN_DIR=share/man
}

build() {
  cd "CastXML-$pkgver"
  make
}

package(){
  cd "CastXML-$pkgver"
  make DESTDIR="$pkgdir" install
}
