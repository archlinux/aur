# Maintainer: Caden Finley <caden@cadenfinley.com>
pkgname=cjsh
pkgver=3.10.8
pkgrel=1
pkgdesc="POSIX shell scripting with modern shell features"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/CadenFinley/CJsShell"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CadenFinley/CJsShell/archive/$pkgver.tar.gz")
sha256sums=('75df0bfa9fe226ec768e3c74264e2bfa14c4a8189991ccb36ab21ea00517d6f7')

build() {
    cd "CJsShell-$pkgver"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --config Release -j$(nproc)
}

package() {
    cd "CJsShell-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --config Release
}
