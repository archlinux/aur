# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sandsmark-screenshot-git
pkgver=8.b0ce35a
pkgrel=1
pkgdesc="Trivial application to take screenshots and put them on the clipboard"
arch=('x86_64')
url='https://github.com/sandsmark/sandsmark-screenshot'
license=('GPL')
depends=( 'qt5-base')
makedepends=('git' 'cmake')
provides=('sandsmark-screenshot')
conflicts=('sandsmark-screenshot')
source=('git+https://github.com/sandsmark/sandsmark-screenshot.git')
sha256sums=('SKIP')

pkgver() {
    cd sandsmark-screenshot
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../sandsmark-screenshot \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
