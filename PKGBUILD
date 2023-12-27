# Maintainer: Tomaz Canabrava <tcanabrava@archlinux.org>
pkgname=xwaylandvideobridge
pkgver=0.4.0
pkgrel=1
pkgdesc='Utility to allow streaming Wayland windows to X applications'
arch=(x86_64)
url='https://invent.kde.org/system/xwaylandvideobridge'
license=(LGPL GPL)
groups=(kde-system)

depends=(
    glibc
    gcc-libs
    qt5-base
    qt5-declarative
    qt5-x11extras
    kcoreaddons5
    ki18n5
    kwindowsystem5
    knotifications5
    kpipewire
    libxcb
)

makedepends=(
    extra-cmake-modules
    kdoctools5
)

source=(https://download.kde.org/stable/xwaylandvideobridge/$pkgname-$pkgver.tar.xz{,.sig})

sha256sums=(
    'ea72ac7b2a67578e9994dcb0619602ead3097a46fb9336661da200e63927ebe6'
    'SKIP'
)

validpgpkeys=(
  E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
