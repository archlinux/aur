# Maintainer: gimgiwer <gimgiwer@gmail.com>
pkgname=swiftify
pkgver=0.18.0
pkgrel=1
pkgdesc="A Spotify player for Wayland, in Material 3 after end4"
arch=('x86_64' 'aarch64')
url="https://github.com/swiftify-org/swiftify"
license=('custom')
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
sha256sums=('db887ff74e04a79b610bf9950bea99c0a25f63c46c758c933eba6c6696a106d5')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -G Ninja         -DCMAKE_BUILD_TYPE=Release         -DCMAKE_INSTALL_PREFIX=/usr         -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}-${pkgver}/third_party/material-color-utilities/LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/material-color-utilities.LICENSE"
}
