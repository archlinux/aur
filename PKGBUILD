pkgname=eternal-terminal
pkgver=0.2.1
pkgrel=1
pkgdesc="A custom Qt6 terminal emulator"
arch=('x86_64')
url="https://github.com/FourSage747/EternalTerminal"
license=('GPL')

depends=(
    'qt6-base'
    'qt6-declarative'
)

source=(
    "https://github.com/FourSage747/EternalTerminal/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('0215b299bef571df69c4ccc26cac4f1c44280de92df00c0ac391d43d003f25db')


build() {
    cmake -B build \
        -S "$srcdir/EternalTerminal-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    cmake --install build --prefix "$pkgdir/usr"

    install -d "$pkgdir/usr/bin"

    ln -s EternalTerminalApp "$pkgdir/usr/bin/eternal-terminal"
}
