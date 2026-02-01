# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=drkonqi
pkgname=drkonqi-git
pkgver=6.5.90.r10.g975563ff0
pkgrel=1
pkgdesc='The KDE crash handler (Git version)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
groups=(plasma-git)
depends=(
  elfutils
  gcc-libs
  gdb
  glibc
  kcmutils
  kconfig
  kcoreaddons
  kcrash
  ki18n
  kidletime
  kio
  kirigami
  kitemmodels
  knotifications
  kservice
  kstatusnotifieritem
  kwallet
  kwidgetsaddons
  kwindowsystem
  polkit-qt6
  python
  python-psutil
  python-pygdbmi
  python-sentry_sdk
  qt6-base
  qt6-declarative
  syntax-highlighting
  systemd-libs
)
makedepends=(
  extra-cmake-modules
  git
)
conflicts=(drkonqi)
provides=(drkonqi)
source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_PYTHON_VENDORING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
-f