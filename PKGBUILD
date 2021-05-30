# Merged with official ABS ksshaskpass PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ksshaskpass-git
pkgver=5.22.80_r196.gdaa2679
pkgrel=1
pkgdesc='ssh-add helper that uses kwallet-git and kpassworddialog'
url='https://kde.org/plasma-desktop/'
license=(GPL)
arch=($CARCH)
depends=(kwallet-git)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git} x11-ssh-askpass)
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
