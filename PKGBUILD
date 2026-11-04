# Maintainer: Nico Ungruhe <nico@planet-express.org>

pkgname="kwi"
pkgrel=6
pkgver=0.1.0
pkgdesc="Modern and fast terminal for KDE Plasma and other desktops"
arch=('x86_64')
url="https://invent.kde.org/utilities/${pkgname}"
license=('GPL-2.0-only OR GPL-3.0-only OR LicenseRef-scancode-kde-accepted-gpl'
    'LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-scancode-kde-accepted-lgpl'
    'GPL-2.0-or-later'
    'LGPL-2.0-or-later'
    'CC0-1.0'
    'BSD-2-Clause'
    'CC-BY-SA-4.0'
)
makedepends=('cmake' 'extra-cmake-modules' 'ninja' 'git' 'qt6-shadertools')
depends=('qt6-base' 'qt6-declarative'
    'kwindowsystem' 'kwidgetsaddons' 'kguiaddons' 'kdbusaddons' 'ki18n'
    'knotifications' 'kcoreaddons' 'kconfig' 'kpty' 'kconfigwidgets' 'kio'
    'kparts' 'kxmlgui' 'kitemmodels' 'qqc2-desktop-style'
    'kirigami' 'kirigami-addons' 'kirigami-app-components'
    'ghostty')
provides=('kwi')
source=("kwi::git+https://invent.kde.org/utilities/kwi#commit=7e36a6d18441e39ede1a0c2992d1a17238e571bf")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    grep "project(kwi VERSION" CMakeLists.txt | cut -d " " -f 3
}

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}"
        -G Ninja
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
