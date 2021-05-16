# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Merged with official ABS ksnip PKGBUILD by João, 2021/05/15 (all respective contributors apply herein)
# Contributor: João Figueiredo <jf.mundox@gmail.com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip-git
pkgver=1.9.0_r2028.gff73c81
pkgrel=1
pkgdesc='Qt-based screenshot tool that provides many annotation features'
arch=($CARCH)
url='https://github.com/DamirPorobic/ksnip'
license=(GPL2)
depends=(hicolor-icon-theme kcolorpicker-git kimageannotator-git qt5-x11extras)
makedepends=(git cmake extra-cmake-modules-git ninja qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'project(ksnip' CMakeLists.txt | sed 's/.* //g' | tr - .)"
  echo "${_ver%)}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -S ${pkgname%-git} -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
