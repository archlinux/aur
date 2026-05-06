# Maintainer: judge <judge@felixrichter.tech>
 
pkgname=tree-sitter-qmljs
pkgver=0.3.0
pkgrel=1
pkgdesc="QML grammar for the tree-sitter parsing library"
arch=('x86_64')
url="https://github.com/yuja/tree-sitter-qmljs"
license=('MIT')
depends=('tree-sitter')
makedepends=('git' 'gcc')
provides=('tree-sitter-qmljs')
source=("git+https://github.com/yuja/tree-sitter-qmljs.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  # Using the simplified compilation method for existing C files [2]
  gcc ./src/parser.c ./src/scanner.c -fPIC -I./ --shared -o libtree-sitter-qmljs.so
}

package() {
  cd "$srcdir/${pkgname}"
  # Install to system directory to avoid manual maintenance
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -m755 libtree-sitter-qmljs.so "${pkgdir}/usr/lib/${pkgname}/"
  
  # Install LICENSE [1]
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
