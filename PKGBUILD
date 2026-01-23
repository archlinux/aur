# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=keepsecret-git
pkgver=1.0.0.r22.0bd9867
pkgrel=1
pkgdesc='Password manager'
arch=(x86_64)
url='https://apps.kde.org/keepsecret/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kitemmodels
         kirigami
         kirigami-addons
         libsecret
         org.freedesktop.secrets
         qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(extra-cmake-modules
             git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://invent.kde.org/utilities/keepsecret.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
