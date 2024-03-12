# Merged with official ABS kgamma PKGBUILD by João, 2024/03/12 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kgamma-git
pkgver=14.12.3_r267.gfe1ff51
pkgrel=1
pkgdesc='Adjust your monitor gamma settings'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kcmutils-git kconfig-git kcoreaddons-git ki18n-git libx11 libxxf86vm qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
conflicts=(${pkgname%-git} kgamma5 kgamma5-git)
provides=(${pkgname%-git})
replaces=(kgamma5-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build  -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
