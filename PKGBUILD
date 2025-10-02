# Maintainer:  Berrit Birkner <aur at bbirkner.de>

pkgname=qrca-git
epoch=1
pkgver=25.11.70.r522.9f27740
pkgrel=1
pkgdesc="Scan QR-Codes with your camera on phones and laptops, and create your own for easily sharing data between devices."
arch=('x86_64' 'aarch64')
url="https://apps.kde.org/de/qrca/"
license=('GPL-3.0-or-later')
depends=(
    "qt6-declarative"
    "hicolor-icon-theme"
    "gcc-libs"
    "xdg-utils"
    "prison"
    "kcontacts"
    "knotifications"
    "kcoreaddons"
    "ki18n"
    "kio"
    "kservice"
    "qt6-base"
    "kirigami"
    "kirigami-addons"
    "purpose"
)
makedepends=(
    "git"
    "cmake"
    "extra-cmake-modules"
    "qt6-svg"
    "qt6-multimedia"
    "python"
    "kguiaddons"
)
provides=('qrca')
conflicts=('qrca')
source=($pkgname::"git+https://invent.kde.org/utilities/qrca.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "%sr%s.%s" "$(awk -F '"' -v ORS="." '/\(RELEASE_SERVICE_VERSION_/ {print $2}' CMakeLists.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package () {
    DESTDIR="$pkgdir" cmake --install build
}
