# Maintainer: Ranieri Althoff <ranisalt at protonmail dot com>
_gitname=catch2
pkgname=$_gitname-git
pkgver=v2.1.2.19.gcf4b7eea
pkgrel=1
pkgdesc="A modern, C++-native, header-only, test framework for unit-tests, TDD and BDD - using C++11, C++14, C++17 and later"
arch=('any')
url="https://github.com/catchorg/$_gitname"
license=('boost')
makedepends=(cmake make git)
provides=("$_gitname")
conflicts=("$_gitname")
source=("$_gitname::git+https://github.com/catchorg/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(git describe --long --tags | tr - .)"
}

build() {
    cd "$srcdir/$_gitname"

    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_INSTALL_LIBDIR="lib" .
    make
}

check() {
    cd "$srcdir/$_gitname"

    cmake -DBUILD_TESTING=ON .
    make test
}

package() {
    cd "$srcdir/$_gitname"

    make install
}
