# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
pkgname=clasp-cl
pkgname=clasp-cl-git
pkgver=0.4.2.r2620.g76184bf74
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
depends=('llvm90' 'clang90')
makedepends=('git' 'automake' 'cmake' 'boost' 'python' 'zlib' 'ncurses' 'expat' 'libedit' 'sbcl')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl')
source=('git://github.com/clasp-developers/clasp.git'
'wscript.config')
sha512sums=('SKIP'
            '2d0aabcf7eab3a8e0d0003db24e67bb1d5f5bcdc5c6371e3abf4cd27d69177c7134e279bf1af0cdcf7a1ab555a8c4cd21da2a7f23abcb6ef997ccc9cda1d2376')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    cp ../wscript.config .
    sed -i s/\"--link-static\",//g wscript
    ./waf configure
    ./waf build_cboehm
}

package() {
  cd "$_srcname/"
  ./waf install_cboehm --destdir "$pkgdir"
}
