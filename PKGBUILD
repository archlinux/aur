# Maintainer: Filon Oikonomou <filwn.oikonomou at gmail dot com>

_pkgnamebase=cppfront
pkgname=${_pkgnamebase}-git
pkgver=r303.b1754db
pkgrel=1
pkgdesc="Experimental and incomplete compiler for proposed C++ 'syntax 2'"
arch=('x86_64')
url='https://github.com/hsutter/cppfront'
license=('CCPL')
makedepends=(
    'gcc'
    'git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgnamebase}"

    # As of writing this, there are no tags or official releases
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgnamebase}/source/"
    g++ ${CXXFLAGS} cppfront.cpp -o cppfront -std=c++20
}

package() {
    install -Dm755 "$srcdir/${_pkgnamebase}/source/cppfront" \
        -t "$pkgdir/usr/bin/"

    install -Dm644 "$srcdir/${_pkgnamebase}/include/cpp2util.h" \
        -t "$pkgdir/usr/include/"
}
