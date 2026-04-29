# Maintainer: Monjaris <ziyanobruzlu750@gmail.com>
pkgname=edex
pkgver=0.1.0
pkgrel=7
pkgdesc="A minimal GUI text editor written in C++ with raylib"
arch=('x86_64')
url="https://github.com/Monjaris/Edex"
license=('custom:unlicensed')
depends=('raylib')
makedepends=('gcc')
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
    cd "Edex-main"
    mkdir -p bin
    g++ $(find src -name "*.cpp") -Iinclude -std=c++20 -O2 \
        -DEDEX_DEFAULT_BUFFER_FONT=\"/usr/share/edex/fonts/JetBrainsMono/JetBrainsMono-Regular.ttf\" \
        -DEDEX_DEFAULT_UI_FONT=\"/usr/share/edex/fonts/InterVariable/InterVariable.ttf\" \
        -lraylib -lGL -lm -lpthread -ldl -lrt \
        -o bin/main
}

package() {
    cd "Edex-main"
    install -Dm755 "bin/main" "$pkgdir/usr/bin/edex-editor"
    install -dm755 "$pkgdir/usr/share/edex/fonts"
    cp -r assets/fonts/. "$pkgdir/usr/share/edex/fonts/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
