# Maintainer: Josep Mengual <josepmengual at protonmail.com>

pkgname=wine-discord-ipc-bridge-git
pkgver=0.0.1.r6.g2f9dfca
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/0e4ef622/wine-discord-ipc-bridge"
license=('MIT')
makedepends=('mingw-w64-gcc' 'mingw-w64-binutils')
provides=("$pkgname-git")
conflicts=("$pkgname-git")
source=(git+https://github.com/0e4ef622/wine-discord-ipc-bridge.git)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

build() {
    cd "$srcdir/$pkgname"
    i686-w64-mingw32-gcc -masm=intel main.c -o winediscordipcbridge
}

package() {
    cd "$srcdir/$pkgname"
    i686-w64-mingw32-strip -x winediscordipcbridge.exe
    install -D winediscordipcbridge.exe $pkgdir/opt/$pkgname/winediscordipcbridge.exe
}
