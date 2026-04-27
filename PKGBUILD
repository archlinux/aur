# Maintainer: Dejan Noveski <deko@duck.com>
pkgname=vermouth
pkgver=1.4.1
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
    'sdl2'
)
optdepends=(
    'icoutils: Windows icon extraction'
    'sdl2: gamepad support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dekomote/vermouth/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e617666c09cddc526ac8d92f0025f4a26d06437c3cda8bc117ecd5a2d46221a2')

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
