# Maintainer: Hantz V <errpell@protonmail.com>
pkgname=neo-git
pkgver=r51.c62ce11
pkgrel=1
pkgdesc="Visual programming language and real time visualizer and controller for connected objects."
arch=('x86_64')
url="https://gitlab.com/hantz/Neo.git"
license=('GPL3')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-webengine')
makedepends=('git')
install=
source=('neo-git::git+https://gitlab.com/hantz/Neo.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cd "$pkgname"
    cmake ./
    cmake --build ./
}

package() {
    cd "$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    make install
    find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}
