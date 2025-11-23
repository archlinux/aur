# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>
pkgname=chatgpt-desktop-unix-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Unofficial ChatGPT desktop app for Linux and BSD (Qt6, QtWebEngine)"
arch=('x86_64')
url="https://github.com/KuznixTeam/chatgpt-desktop-unix"
license=('GPL3')
depends=('qt6-base' 'qt6-webengine' 'cmake' 'gcc' 'make')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname/build"
    install -Dm755 chatgpt-desktop-unix "$pkgdir/usr/bin/chatgpt-desktop-unix"
    install -Dm644 ../chatgpt-desktop-unix.desktop "$pkgdir/usr/share/applications/chatgpt-desktop-unix.desktop"
    install -Dm644 ../app.png "$pkgdir/usr/share/pixmaps/app.png"
}
