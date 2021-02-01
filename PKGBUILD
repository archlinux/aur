# Merged with official ABS kimap2 PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Contributor: Jens Staal <staal1978@gmail.com>

# Adopted from kimap-git
# Antonio Rojas <arojas@archlinux.org>


pkgname=kimap2-git
pkgver=0.4_r824.gee0dd26
pkgrel=1
pkgdesc="Job-based API for interacting with IMAP servers"
arch=($CARCH)
url="https://community.kde.org/KDE_PIM"
license=(LGPL)
groups=(kdepim-git)
depends=(kcoreaddons-git kmime-git)
makedepends=(git extra-cmake-modules-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KIMAP2_LIB_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
