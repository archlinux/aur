# Maintainer: Arsoniv <arsonivalt@gmail.com>
pkgname=axenc-git
pkgver=0.1.0.r2.g7f4db1b
pkgrel=1
pkgdesc="Axen language compiler (git development branch)"
arch=('x86_64')
url="https://github.com/arsoniv/axenc"
license=('GPL3')
depends=('llvm')
makedepends=('base-devel' 'cmake' 'git')
provides=('axenc')
conflicts=('axenc')

source=("git+https://github.com/arsoniv/axenc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/axenc"
    local commits=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    echo "0.1.0.r${commits}.g${hash}"
}

build() {
    cd "$srcdir/axenc"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/axenc/build"
    install -Dm755 axenc "$pkgdir/usr/bin/axenc"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

