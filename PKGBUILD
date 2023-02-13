# Merged with official ABS frameworkintegration PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=frameworkintegration-git
pkgver=5.240.0_r674.g6d87885
pkgrel=1
pkgdesc='Framework providing components to allow applications to integrate with a KDE Workspace'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(knewstuff-git)
makedepends=(git extra-cmake-modules-git appstream-qt packagekit-qt6)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('appstream-qt: dependency resolving via AppStream' 'packagekit-qt6: dependency resolving via AppStream')
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
