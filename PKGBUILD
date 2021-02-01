# Merged with official ABS kpimtextedit PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kpimtextedit-git
pkgver=5.16.40_r1327.gcea5570
pkgrel=1
pkgdesc="A textedit with PIM-specific features"
arch=($CARCH)
url="https://kontact.kde.org"
license=(LGPL)
groups=(kdepim-git)
depends=(kio-git syntax-highlighting-git)
makedepends=(git extra-cmake-modules-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PIM_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
