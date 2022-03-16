# Maintainer: redstrate <josh@redstrate.com>
# Contributor: Lionel Peller <errpell@protonmail.com>
pkgname=trinity-matrix-git
pkgver=r4.77adaeb
pkgrel=1
pkgdesc="Qt5 QML Matrix client"
arch=('x86_64')
url="https://git.sr.ht/~redstrate/trinity"
license=('GPL3')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-webengine' 'cmark' 'libolm')
makedepends=('git' 'cmake')
install=
source=('trinity-matrix-git::git+https://git.sr.ht/~redstrate/trinity')
md5sums=('SKIP')

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

