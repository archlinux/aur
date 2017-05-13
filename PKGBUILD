# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=kcyberfoxhelper
pkgver=5.0.1.3
pkgrel=1
pkgdesc="Cyberfox KDE Plasma Integration"
url="https://github.com/hawkeye116477/kcyberfoxhelper"
arch=("x86_64")
license=('MIT')
depends=('ki18n' 'kio' 'knotifications' 'kwindowsystem')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hawkeye116477/kcyberfoxhelper/archive/v${pkgver}.tar.gz")
options=('!emptydirs' '!strip')

prepare() {
    if [[ -d build ]]; then
        rm -Rf build
    fi
    mkdir -p build
}

build() {
    cd build  
    cmake ../$pkgname-$pkgver \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
make
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('74a79b47d2621e78d8371bc6920f5b41a6ae7fa2573c2a01ce0a5c61bf5ed4db')
