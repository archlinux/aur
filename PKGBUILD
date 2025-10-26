# Maintainer: Zachary Massey (echtoplasm) <zacharyamassey@gmail.com>
pkgname=gshell
pkgver=0.1
pkgrel=1
pkgdesc="A customizable terminal system monitor for Kitty with GIF support (BETA)"
arch=('x86_64')
url="https://github.com/echtoplasm/gshell"
license=('MIT')
depends=('kitty' 'ftxui')
makedepends=('cmake' 'git')
source=("git+https://github.com/echtoplasm/gshell.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    
    make
}

package() {
    cd "$pkgname/build"
    
    install -Dm755 gshell "$pkgdir/usr/bin/gshell"
    install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
