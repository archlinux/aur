# Maintainer: Elias Riedel Gårding <eliasrg@kth.se>
# Author: Miloš Stojanović <mc.cm.mail@gmail.com>
# Discussion: https://www.reddit.com/r/unixporn/comments/btg6rj/oc_tmatrix_a_new_terminal_digital_rain_simulator
pkgname=tmatrix-git
pkgver=1.1.r13.gf192137
pkgrel=1
pkgdesc="A cmatrix-like replica of the digital rain from the Matrix"
arch=('x86_64' 'i686')
url="https://github.com/M4444/TMatrix"
license=('GPL2')
depends=('ncurses')
makedepends=('git' 'cmake')
provides=('tmatrix')
conflicts=('tmatrix')
source=("${pkgname%%-git}::git+https://github.com/M4444/TMatrix.git")
md5sums=('SKIP')


pkgver() {
    cd "${pkgname%%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${pkgname%%-git}"
    mkdir -p build && cd build

    cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
    make -j8
}


package() {
    cd "${pkgname%%-git}/build"
    make install
}
