# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kio-admin-git
pkgver=1.0_r95.ge884510
pkgrel=1
pkgdesc='Manage files as administrator using the admin:// KIO protocol.'
arch=($CARCH)
url='https://invent.kde.org/system/kio-admin'
license=(GPL)
depends=(kio-git)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "project(${pkgname%-git} VERSION" CMakeLists.txt | cut -d ' ' -f3 | tr - .)"
  echo "${_ver/)/}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
