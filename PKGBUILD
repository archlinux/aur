pkgname=eternal-terminal
pkgver=0.1.0
pkgrel=3
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

sha256sums=('8e8bbb19b44285bc1a256e8450381ed68246a1a14146aab9e477fc6d8d258352')


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
