# Maintainer:
# Contributor: Tomaz Canabrava <tcanabrava@archlinux.org>

pkgname=xwaylandvideobridge
pkgver=0.5.3
pkgrel=1
pkgdesc="Utility to allow streaming Wayland windows to X applications"
arch=('x86_64')
url="https://invent.kde.org/system/xwaylandvideobridge"
license=('BSD-3-Clause' 'LGPL-2.1-or-later' 'LicenseRef-scancode-kde-accepted-gpl')
depends=('glibc'
         'hicolor-icon-theme'
         'kcoreaddons'
         'kcrash'
         'kdbusaddons'
         'ki18n'
         'kpipewire'
         'kstatusnotifieritem'
         'kwindowsystem'
         'libstdc++'
         'libxcb'
         'qt6-base'
         'qt6-declarative')
makedepends=('cmake' 'extra-cmake-modules' 'vulkan-headers')
source=("https://download.kde.org/stable/${pkgname}/src/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('b96194c68ef67ac3127cf353f026b5b69d35c7d5e204bd89d1155c74f2fe073a'
            'SKIP')
validpgpkeys=('D253F4FD09638D1D6B65354B3B0E1973DFCD652D') # Hadi Chokr <hadichokr@icloud.com>

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}-${pkgver}"
        -W no-author
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_TESTING=OFF
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSES/{BSD-3-Clause.txt,LicenseRef-KDE-Accepted-GPL.txt} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
