# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-resources-monitor-git
_gitpkgname=plasma-applet-resources-monitor
pkgver=3.4.1.r0.g082ec1b
pkgrel=1
pkgdesc='Plasmoid for monitoring CPU, memory, network traffic, GPUs and disks IO'
arch=(any)
url=https://github.com/orblazer/plasma-applet-resources-monitor
license=(GPL-3.0-or-later)
depends=(
    kitemmodels
    kquickcharts
    libksysguard
    libplasma
    plasma5support
)
optdepends=(
    "kdeplasma-addons: to support easier click action"
)
makedepends=(
    cmake
    extra-cmake-modules
    git
)
conflicts=(
    plasma5-applets-resources-monitor-git
    plasma6-applets-resources-monitor
)
source=($_gitpkgname::git+https://github.com/orblazer/${_gitpkgname})
b2sums=(SKIP)

pkgver() {
    cd $_gitpkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S $_gitpkgname
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
