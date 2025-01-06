# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
# Maintainer: Pierre Avizou <aur at avizou dot eu>

pkgname=keyboard-visualizer-git
pkgver=4.00.r26.gb50cc50
pkgrel=1
pkgdesc="Turn your OpenRGB-supported RGB setup into a spectacular light show for your music"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/KeyboardVisualizer"
license=('GPL2')
depends=('openal' 'openrgb')
makedepends=('git' 'make' 'binutils' 'pkgconf')
provides=('keyboard-visualizer')
conflicts=('keyboard-visualizer')
source=("git+https://gitlab.com/CalcProgrammer1/KeyboardVisualizer.git")
sha256sums=('SKIP')

pkgver() {
    cd KeyboardVisualizer
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/KeyboardVisualizer"
    git submodule update --init --recursive
    qmake KeyboardVisualizer.pro PREFIX=/usr
    make
}

package() {
    cd KeyboardVisualizer
    make INSTALL_ROOT="$pkgdir" install
}
