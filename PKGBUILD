# Merged with official ABS kross PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kross-git
pkgver=5.83.0_r324.g6664a5a
pkgrel=1
pkgdesc='Multi-language application scripting'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kparts-git qt5-script)
makedepends=(git extra-cmake-modules-git kdoctools-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf5-aids-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF5\?_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
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
