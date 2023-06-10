# Merged with official ABS ksystemstats PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=ksystemstats-git
pkgver=5.27.80_r310.ga328223
pkgrel=1
pkgdesc='A plugin based system monitoring daemon'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(libksysguard-git)
makedepends=(git extra-cmake-modules-git networkmanager-qt-git)
conflicts=(${pkgname%-git} 'ksysguard<5.21.90' 'ksysguard-git<5.21.90')
provides=(${pkgname%-git})
optdepends=('networkmanager-qt-git: network usage monitor')
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
