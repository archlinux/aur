# Maintainer: Lukas Jacobs <oss@lukasjacobs.de>

pkgname=kando-kwin-integration
pkgver=0.4.2
pkgrel=1
pkgdesc="A small KWin plugin required for Kando on Wayland."
arch=('x86_64' 'aarch64')
url="https://github.com/kando-menu/kwin-integration"
license=('MIT')
depends=(
    'kwin>=6.8'
    'kwin<6.9' # Pinning kwin to 6.8. Once the next lands, this package needs an update
    'kcoreaddons'
    'qt6-base'
)
makedepends=(
    'cmake'
    'ninja'
    'extra-cmake-modules'
    'vulkan-headers'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2dc86aa6fcdb46576d8d03875cc2497b36a63e2519cab0db62a3a8c523be7b8')

build() {
    cmake -B build -S "kwin-integration-$pkgver" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "kwin-integration-$pkgver/LICENSES/MIT.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
