# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=kcyberfoxhelper
pkgver=5.0.1.6
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


sha256sums=('3d44cb36edd1590c585d732cc614db98faa94cc1a58638d8ba67082f52f3d479')
