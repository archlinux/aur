# Maintainer: Frédéric Nadeau <fred.nadeau@gmail.com>
pkgname="cgreen"
pkgver="1.3.0"
pkgrel=1
pkgdesc="A modern, portable, cross-language unit testing and mocking framework for C and C++"
arch=('x86_64')
url="https://github.com/cgreen-devs/cgreen/releases/tag/${pkgver}"
license=('ISC')
makedepends=('cmake>=2.8.5' 'gcc' 'git')
provides=('libcgreen.so')
source=("${pkgname}::git+https://github.com/cgreen-devs/cgreen.git#tag=${pkgver}")

sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
          -DCMAKE_INSTALL_LIBDIR="lib"       \
          ..
    make
}

check() {
    cd "$srcdir/${pkgname}/build"
    make test
}

package() {
    cd "$srcdir/${pkgname}/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ..//contrib/completion/cgreen_bash_completion "${pkgdir}/usr/share/bash-completion/completions/cgreen"
}
