# Contributor: Eric Schulte <eschulte@grammatech.com>
_srcname=clasp
pkgname=cclasp-boehm-git
pkgver=0.4.2.r588.g87c09be5b
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
depends=()
makedepends=('git' 'automake' 'llvm' 'clang' 'cmake' 'boost' 'python2' 'zlib' 'ncurses' 'expat' 'libedit' 'sbcl')
provides=('cclasp-boehm')
source=('git://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_srcname/"
    ./waf configure --prefix=/usr
    ./waf --jobs 2 build_fboehm
    ./waf --jobs 2 build_cboehm
}

package() {
  cd "$_srcname/"
  ./waf install_cboehm --destdir "$pkgdir"
  rm $pkgdir/usr/bin/clasp
}
