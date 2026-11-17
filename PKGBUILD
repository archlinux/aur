# Maintainer: strandzen <strandzen@gmail.com>
# Latest development version: builds the latest commit from GitHub.
# For the latest release, use packaging/appimage-manager-plasma/PKGBUILD.
pkgname=appimage-manager-plasma-git
pkgver=r0.000000
pkgrel=1
pkgdesc="A lightweight KDE Plasma utility for installing, managing, and removing AppImage files (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/strandzen/AppImage-Manager"
license=('GPL-2.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'kirigami'
    'kirigami-addons'
    'kcoreaddons'
    'ki18n'
    'kconfig'
    'kio'
    'kiconthemes'
    'knotifications'
    'kcrash'
    'kdbusaddons'
    'kstatusnotifieritem'
    'layer-shell-qt'
    'libappimage'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
    'ninja'
    'qt6-tools'
)
optdepends=(
    'am-git: install AppImages via the AM package manager'
    'bubblewrap: run apps in a sandbox'
    'libcanberra: completion sound notifications'
)
provides=('appimagemanager' 'appimage-manager-plasma')
conflicts=('appimage-manager-plasma')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$pkgname" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
