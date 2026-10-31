# Maintainer: gimgiwer <gimgiwer@gmail.com>
pkgname=swiftify
pkgver=0.25.1
pkgrel=1
pkgdesc="A Spotify player for Wayland, in Material 3 after end4"
arch=('x86_64' 'aarch64')
url="https://github.com/swiftify-org/swiftify"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'hicolor-icon-theme'
    'libpulse'
    'openssl'
    'qcoro'
    'qt6-base'
    'qt6-declarative'
    'qt6-wayland'
    'qt6-websockets'
    'qtkeychain-qt6'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'qt6-shadertools'
    'rust'
)
optdepends=(
    'ttf-material-symbols-variable-git: icon font, if not bundled'
    'xdg-desktop-portal: native file picker for cover photos'
)
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swiftify-org/swiftify/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('374301757fb83776275153cb4fa078d9f2849a8e26a1431c2d4c2500e3fee12c')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -G Ninja         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr         -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
