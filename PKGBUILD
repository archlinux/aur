# Merged with official ABS kimageannotator-qt5 PKGBUILD by João, 2024/03/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kimageannotator-qt5-git
pkgver=0.7.1_r1174.g75a1f38
pkgrel=1
pkgdesc='Tool for annotating images'
arch=($CARCH)
url="https://github.com/ksnip/${pkgname%%-*}"
license=(LGPL-3.0-only)
depends=(gcc-libs glibc kcolorpicker-qt5 libx11 qt5-base qt5-svg)
makedepends=(git cmake qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%%-*}
  _ver="$(grep -m1 "project(.*VERSION" CMakeLists.txt | sed 's/.* //;s/-/./g;s/)//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%%-*} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
