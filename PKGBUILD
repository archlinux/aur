# Maintainer: Lionel Peller <errpell@protonmail.com>
pkgname=trinity-matrix-git
pkgver=r56.1cc861e
pkgrel=1
pkgdesc="Qt5 QML Matrix client"
arch=('x86_64')
url="https://github.com/invghost/Trinity.git"
license=('GPL3')
depends=('qt5-webengine' 'cmark')
makedepends=('git')
install=
source=('trinity-matrix-git::git+https://github.com/invghost/Trinity.git')
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
