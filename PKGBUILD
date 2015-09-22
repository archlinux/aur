# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

_pkgname=Orayta-Books
pkgname=orayta-books
pkgver=r2.4214f16
pkgrel=1
pkgdesc="Orayta books"
arch=('any')
license=('CC-BY-3.0')
url="http://code.google.com/p/orayta/"
makedepends=('git')
conflicts=('orayta-books-svn')
source=(git+https://github.com/MosheWagner/Orayta-Books.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
cd $srcdir/$_pkgname/books
./GenMakeFile.sh
}

package() {
cd $srcdir/$_pkgname/books
make DESTDIR=$pkgdir install
}
