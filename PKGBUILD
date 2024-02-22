# Maintainer: Tomaz Canabrava <tcanabrava@archlinux.org>

pkgname=xwaylandvideobridge
pkgver=0.4.0
pkgrel=2
pkgdesc='Utility to allow streaming Wayland windows to X applications'
arch=(x86_64)
url='https://invent.kde.org/system/xwaylandvideobridge'
license=(LGPL GPL)
depends=(
    glibc
    gcc-libs
    qt6-base
    qt6-declarative
    kcoreaddons
    ki18n
    kwindowsystem
    kpipewire
    kstatusnotifieritem
    libxcb
)

makedepends=(
    extra-cmake-modules
    kdoctools
    knotifications
)

source=(https://download.kde.org/stable/xwaylandvideobridge/$pkgname-$pkgver.tar.xz{,.sig})

sha256sums=('ea72ac7b2a67578e9994dcb0619602ead3097a46fb9336661da200e63927ebe6'
            'SKIP')

validpgpkeys=(
  E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
