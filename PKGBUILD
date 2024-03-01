# Merged with official ABS ksnip PKGBUILD by João, 2024/03/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Merged with official ABS ksnip PKGBUILD by João, 2021/05/15 (all respective contributors apply herein)
# Contributor: João Figueiredo <jf.mundox@gmail.com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip-git
pkgver=1.11.0_r2770.g99327370
pkgrel=1
pkgdesc='Qt-based screenshot tool that provides many annotation features'
arch=($CARCH)
url="https://github.com/ksnip/${pkgname%-git}"
license=(GPL2)
depends=(hicolor-icon-theme kimageannotator-qt5-git qt5-x11extras)
makedepends=(cmake extra-cmake-modules ninja qt5-tools)
source=("git+https://github.com/ksnip/${pkgname%-git}.git")
sha256sums=('SKIP')


pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "project(${pkgname%-git}" CMakeLists.txt | sed -e 's/.* //' -e 's/-/./g' -e 's/)//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -S ${pkgname%-git} -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
