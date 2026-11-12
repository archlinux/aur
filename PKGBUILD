# Maintainer: João Pedro Oliveira <oliveira.joao@unifesp.br>
pkgname=wiredpanda
pkgver=5.2.2
pkgrel=1
pkgdesc="Software designed to help students learn about logic circuits and simulate them in an easy and friendly way"
arch=('x86_64' 'aarch64')
url="https://gibis-unifesp.github.io/wiRedPanda/"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg')
makedepends=('cmake' 'ninja' 'git' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GIBIS-UNIFESP/wiRedPanda/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f099a92d7ac4e7babce79b293076946e78eb53830e90a6be26184f368d2ea398')

build() {
    cd "wiRedPanda-${pkgver}"
    cmake --preset release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build --preset release
}

check() {
    cd "wiRedPanda-${pkgver}"
    export QT_QPA_PLATFORM=offscreen
    ctest --preset release --output-on-failure -LE gui
}

package() {
    cd "wiRedPanda-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build-release
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
