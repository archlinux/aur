# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=castxml
pkgdesc="C-family abstract syntax tree XML output tool."
pkgver=0.4.6
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/CastXML/CastXML"
license=(Apache)
depends=(llvm clang)
makedepends=(cmake python-sphinx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/CastXML/CastXML/archive/v$pkgver.tar.gz")
sha256sums=('8dcdbc1f23a130e4bdb0b09f57c30761a02a346b4db4037555048af2a293d66a')

prepare() {
  cd "CastXML-$pkgver"

  # Fix build issue as reported by Kniyl here https://github.com/CastXML/CastXML/issues/102
  sed -i "s|\${llvm_libs}|LLVM|g" src/CMakeLists.txt

  cmake . \
    -DCLANG_LINK_CLANG_DYLIB=1 \
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
