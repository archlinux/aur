# Maintainer: Amarnath Patel <apatel6ty@protonmail.com>

pkgname=wart
pkgver=r12.6450308
pkgrel=1
pkgdesc="A simple configurable wallpaper applier from Bing.com for Linux"
arch=('x86_64')
url="https://github.com/jeebuscrossaint/wart"
license=('BSD-2')
depends=('curl' 'nlohmann-json')
makedepends=('cmake' 'clang' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/jeebuscrossaint/wart.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wart"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/wart"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/wart"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  # if you have a license file
}
