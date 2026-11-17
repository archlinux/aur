# Maintainer: strandzen <strandzen@gmail.com>
#
# Latest release, from its tag on GitHub. For the latest commit, use
# packaging/appimage-manager-plasma-git/PKGBUILD. On a new release, update pkgver and the
# checksum (updpkgsums) once the tag is pushed, then regenerate .SRCINFO.
pkgname=appimage-manager-plasma
pkgver=2.2.1
pkgrel=1
pkgdesc="A lightweight KDE Plasma utility for installing, managing, and removing AppImage files"
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
    'ninja'
    'qt6-tools'
)
optdepends=(
    'am-git: install AppImages via the AM package manager'
    'bubblewrap: run apps in a sandbox'
    'libcanberra: completion sound notifications'
)
provides=('appimagemanager')
conflicts=('appimage-manager-plasma-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/strandzen/AppImage-Manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3a63c43856e7bd0a563cd478045c9128cb86005f4e088d55796d8343a6a9a9b')

build() {
    cmake \
        -B build \
        -S "AppImage-Manager-$pkgver" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
