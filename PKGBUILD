# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sandsmark-screenshot-git
pkgver=5.e2fc792
pkgrel=1
pkgdesc="Trivial application to take screenshots and put them on the clipboard"
arch=('x86_64')
url='https://github.com/sandsmark/sandsmark-screenshot'
license=('GPL')
depends=( 'qt5-base')
makedepends=('git')
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
        cd build
        qmake ../sandsmark-screenshot
}

build() {
    make -C build
}

package() {
    install -Dm755 build/screenshot "${pkgdir}/usr/bin/screenshot"
}
