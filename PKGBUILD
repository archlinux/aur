# Maintainer: Dejan Noveski <deko@duck.com>
pkgname=vermouth
pkgver=2.2.1
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
    'kcolorscheme'
    'kconfig'
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
sha256sums=('779db6ff73db733a0aa9c52f82f59c546409f93d3fc055529c690b36d6d8bd80')

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
