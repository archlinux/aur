# Maintainer: gimgiwer <gimgiwer@gmail.com>
pkgname=swiftify
pkgver=0.26.0
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
sha256sums=('630eb54bc32a90d10e4d7ea98363baeffdbe0dc6dcb1bae0ab171f7c10dd37d5')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -G Ninja         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr         -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
