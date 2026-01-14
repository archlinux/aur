# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=xdg-desktop-portal-kde-git
_pkgname=xdg-desktop-portal-kde
pkgver=6.5.90.r4.4a3e0765
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KF6 (Git version)'
arch=(x86_64)
url='https://invent.kde.org/plasma/xdg-desktop-portal-kde'
license=(LGPL-2.0-or-later)

depends=(
  gcc-libs
  glibc
  kconfig
  kcoreaddons
  kcrash
  kglobalaccel
  kguiaddons
  kiconthemes
  ki18n
  kio
  kio-fuse
  kirigami
  kirigami-addons
  kitemviews
  knotifications
  kpipewire
  kservice
  kstatusnotifieritem
  kwayland
  kwindowsystem
  libxkbcommon
  plasma-workspace
  qt6-base
  qt6-declarative
  wayland
  xdg-desktop-portal
)

makedepends=(
  git
  extra-cmake-modules
  plasma-wayland-protocols
  wayland-protocols
)

provides=(xdg-desktop-portal-impl "$_pkgname")
conflicts=("$_pkgname")

source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
