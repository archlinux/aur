# Maintainer: CUI Hao <cuihao.leo@gmail.com>
pkgname=libmdcpp-git
_pkgname=libmdcpp
pkgdesc="Implementation of the Markdown markup language in CPP (library)"
pkgver=r22.69da1b2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/sadhen/libmdcpp"
license=('GPL3')
provides=('libmdcpp')
conflicts=('libmdcpp')
depends=("boost-libs")
makedepends=('git' 'cmake' 'boost')
source=("git://github.com/sadhen/${_pkgname}.git")
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    cmake "../${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
