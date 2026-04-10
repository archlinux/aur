# Maintainer: Instellate <instellate@instellate.xyz>
pkgname='proton-launcher-qt'
_pkgname='proton-launcher'
pkgver='1.0.0'
pkgrel=1
pkgdesc='A program that manages a library of your games and launches them through proton'
arch=('x86_64')
url="https://github.com/Instellate/proton-launcher"
license=('GPL-3.0-only')
depends=(
    qt6-base
    qt6-declarative
    qcoro
    hicolor-icon-theme
    libstdc++
    libgcc
    libgl
    # KDE Dependencies
    ki18n
    kiconthemes
    kcrash
    kconfig
    kcoreaddons
    kirigami
    kirigami-addons
    karchive
    kstatusnotifieritem
    kdbusaddons
    qqc2-desktop-style
    # Proton Dependencies
    glibc
    libxcrypt
    libxcrypt-compat
    gcc-libs
    libx11
    libxss
    alsa-plugins
    libgpg-error
    nss
    vulkan-driver
    vulkan-icd-loader
)
depends_x86_64=(
  lib32-glibc
  lib32-libxcrypt
  lib32-libxcrypt-compat
  lib32-libgl
  lib32-gcc-libs
  lib32-libx11
  lib32-libxss
  lib32-alsa-plugins
  lib32-libgpg-error
  lib32-nss
  lib32-vulkan-driver
  lib32-vulkan-icd-loader
)
makedepends=(gcc ninja cmake extra-cmake-modules)
conflicts=(proton-launcher)
source=("${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('e74d79cf2596ae80fe9e86c8082e85eb95d61d0764b7b800147c3b9af3ab5cf4')

prepare() {
    mkdir "${srcdir}/build"
    cmake -B "${srcdir}/build" -GNinja -S "${srcdir}/${_pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=Release
}

build() {
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
