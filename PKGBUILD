# Maintainer: Filon Oikonomou <filwn.oikonomou at gmail dot com>

_pkgnamebase=cppfront
pkgname=${_pkgnamebase}-git
pkgver=v0.7.1.r33.gbe17724
pkgrel=1
pkgdesc="Compiler for an experimental C++ 'syntax 2' (Cpp2)"
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

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgnamebase}/source/"
    g++ ${CXXFLAGS} cppfront.cpp -o cppfront -std=c++20
}

package() {
    install -Dm755 "$srcdir/${_pkgnamebase}/source/cppfront" \
        -t "$pkgdir/usr/bin/"

    find $srcdir/${_pkgnamebase}/include/* \
        -exec install -Dm644 '{}' -t "$pkgdir/usr/include/" ';'
}
