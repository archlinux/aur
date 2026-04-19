# Maintainer: Dejan Noveski <deko@duck.com>
pkgname=vermouth
pkgver=1.3.2
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
sha256sums=('c69c0884225867130d3f09fbcb55bf8cbb578f9a9b9fecb4993890aab9d366b5')

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
