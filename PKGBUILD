# Maintainer:  Birk Birkner <aur at bbirkner.de>

pkgname=qrca-git
pkgver=0.1.r297.a64d924
pkgrel=1
pkgdesc="Scan QR-Codes with your camera on phones and laptops, and create your own for easily sharing data between devices."
arch=('x86_64' 'aarch64')
url="https://apps.kde.org/de/qrca/"
license=('GPL3')
_KF_Version=5.240.0
depends=(
    "qt6-declarative"
    "hicolor-icon-theme"
    "gcc-libs"
    "xdg-utils"
    "prison>=${_KF_Version}"
    "kcontacts>=${_KF_Version}"
    "knotifications>=${_KF_Version}"
    "kcoreaddons>=${_KF_Version}"
    "ki18n>=${_KF_Version}"
    "kio>=${_KF_Version}"
    "kservice>=${_KF_Version}"
    "qt6-base"
    "kirigami>=${_KF_Version}"
)
makedepends=(
    "git"
    "cmake"
    "extra-cmake-modules>=${_KF_Version}"
    "qt6-svg"
    "qt6-quickcontrols2"
    "qt6-multimedia"
    "purpose>=${_KF_Version}"
)
provides=('qrca')
conflicts=('qrca')
source=($pkgname::"git+https://invent.kde.org/utilities/qrca.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.%s" "$(awk '{if ($1 ~ "qrca") {print substr($3, 1, length($3)-1)}}' CMakeLists.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
