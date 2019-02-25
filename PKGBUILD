# Maintainer: Stoyan Minaev <stoyan.minaev@gmail.com>

pkgbase="loli"
pkgname="loli"
pkgver="0.8"
pkgrel="1"
pkgdesc="Loli is a embedded programming language"
arch=("x86_64")
license=("MIT")
url="http://loli-lang.ml/"
makedepends=("git" "cmake" "make" "gcc")
provides=("loli")

source=("loli-$pkgver::git+https://github.com/loli-foundation/loli.git#tag=$pkgver")
sha256sums=("SKIP")

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p ./build
    cmake -S ./ -B ./build
    cd ./build && make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p $pkgdir/usr/{bin,lib}
    install -m 755 loli $pkgdir/usr/bin/
    install -m 755 libloli.so $pkgdir/usr/lib/
}
