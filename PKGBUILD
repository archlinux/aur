# Maintainer: Dejan Noveski <deko@duck.com>
pkgname=vermouth
pkgver=1.2.1
pkgrel=1
pkgdesc="A no-frills Wine/Proton game launcher for Linux"
arch=('x86_64')
url="https://github.com/dekomote/vermouth"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'kirigami'
    'ki18n'
    'kcoreaddons'
    'qqc2-desktop-style'
)
makedepends=(
    'cmake'
    'ninja'
    'extra-cmake-modules'
)
optdepends=('icoutils: Windows icon extraction')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dekomote/vermouth/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0f5e05018c9cbe86350e3334a385f14eef5a05845158fe4f1e33b73d739633a')

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
