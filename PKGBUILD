# Maintainer: Dejan Noveski <deko@duck.com>
pkgname=vermouth
pkgver=1.9.7
pkgrel=1
pkgdesc="A game and app launcher for Linux - native, Windows, and retro"
arch=('x86_64')
url="https://github.com/dekomote/vermouth"
license=('MIT')
provides=('vermouth')
conflicts=('vermouth')
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
sha256sums=('6b4e90b986dddc4086f746801aab3e1fbe564af77fcbbaaffd4408a49143cc7d')

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
