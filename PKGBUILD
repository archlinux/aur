# Maintainer: Josep Mengual <josepmengual at protonmail.com>

pkgname=wine-discord-ipc-bridge-git
pkgver=0.0.1.r6.g2f9dfca
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/0e4ef622/wine-discord-ipc-bridge"
license=('MIT')
makedepends=('mingw-w64-gcc' 'mingw-w64-binutils')
provides=('wine-discord-ipc-bridge')
conflicts=('wine-discord-ipc-bridge')
source=(git+https://github.com/0e4ef622/wine-discord-ipc-bridge.git)
sha256sums=('SKIP')

pkgver() {
    cd "wine-discord-ipc-bridge"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

build() {
    cd "$srcdir/wine-discord-ipc-bridge"
    i686-w64-mingw32-gcc -masm=intel main.c -o winediscordipcbridge.exe
}

package() {
    cd "$srcdir/wine-discord-ipc-bridge"
    i686-w64-mingw32-strip -x winediscordipcbridge.exe
    install -D winediscordipcbridge.exe $pkgdir/opt/wine-discord-ipc-bridge/winediscordipcbridge.exe
}
