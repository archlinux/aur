# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=kwaterfoxhelper
pkgver=5.0.1.5
pkgrel=1
pkgdesc="Waterfox KDE Plasma Integration"
url="https://github.com/hawkeye116477/kwaterfoxhelper"
arch=("x86_64")
license=('MIT')
depends=('ki18n' 'kio' 'knotifications' 'kwindowsystem')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hawkeye116477/kwaterfoxhelper/archive/v${pkgver}.tar.gz")
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

sha256sums=('82d6830313508358eee6cb31ee56cd7cabc04aae16afd5e6964968661ccc17f3')
