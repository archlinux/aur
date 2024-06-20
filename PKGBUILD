# Merged with official ABS ksnip PKGBUILD by João, 2024/03/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Merged with official ABS ksnip PKGBUILD by João, 2021/05/15 (all respective contributors apply herein)
# Contributor: João Figueiredo <jf.mundox@gmail.com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip-git
pkgver=1.10.1.r71.gc0c5ae2
pkgrel=1
pkgdesc='Qt-based screenshot tool that provides many annotation features'
arch=($CARCH)
url="https://github.com/ksnip/ksnip"
license=("GPL-2.0-or-later")
depends=(hicolor-icon-theme kimageannotator-qt5 qt5-x11extras)
makedepends=(cmake extra-cmake-modules git ninja qt5-tools)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 --exclude='*[A-Za-z][A-Za-z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -S ${pkgname%-git} -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
