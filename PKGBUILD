# Merged with official ABS knewstuff PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=knewstuff-git
pkgver=5.240.0_r1495.ga6401e50
pkgrel=1
pkgdesc='Support for downloading application assets from the network'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio-git kpackage-git syndication-git)
makedepends=(git extra-cmake-modules-git doxygen qt6-tools qt6-declarative)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('kirigami2-git: QML components')
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(KF_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
