# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=marknote-git
pkgver=1.0.0_r37.g33a2faf
pkgrel=1
pkgdesc="A simple markdown note management app"
arch=($CARCH)
url="https://github.com/KDE/${pkgname%-git}"
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc kconfig5 ki18n5 kirigami2 kdeclarative5 qt5-base qt5-declarative)
makedepends=(git extra-cmake-modules qt5-svg)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git tag --sort=taggerdate | tail -1 | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build  -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
