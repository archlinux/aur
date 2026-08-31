# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-dr-robotnik
pkgver=6.7.4.1
pkgrel=1
pkgdesc='SonicDE crash handler'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-dr-robotnik'
license=(GPL-2.0-or-later)
depends=(elfutils
         gdb
         glibc
         kcmutils
         kconfig
         kcrash
         ki18n
         kitemmodels
         kjobwidgets
         knotifications
         kservice
         kstatusnotifieritem
         kwallet
         kwidgetsaddons
         libgcc
         libstdc++
         polkit-qt6
         python
         python-psutil
         python-pygdbmi
         python-sentry_sdk
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-idle-tracker
         sonic-frameworks-io
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         syntax-highlighting
         systemd-libs)
makedepends=(sonic-frameworks-cmake-modules)
provides=(drkonqi)
conflicts=(drkonqi)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('01e8f38b1caade76a6b7971a5af92d53a3f2f03735e430a81121bace532dcc10')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DENABLE_SYSTEMD_COREDUMP=ON \
    -DWITH_PYTHON_VENDORING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
