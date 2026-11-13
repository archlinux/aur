# Maintainer: Arthur Simin <arthursimao312@gmail.com>
pkgname=vanta
pkgver=1.4.0
pkgrel=1
pkgdesc="Linux game launcher with Wine, Proton and OnlineFix support"
arch=('x86_64')
url="https://github.com/ArthurSimin/Vanta"
license=('AGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'zlib')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c85eaf4026164e8738cfb0a0ba14f0e79af17b1b8bcf5c2ff03304eeb363b979')

build() {
    cd "Vanta-$pkgver"
    cmake -S . -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVANTA_VERSION="$pkgver"
    cmake --build build
}

package() {
    cd "Vanta-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
}
