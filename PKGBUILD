# Merged with official ABS knewstuff PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=knewstuff-git
pkgver=6.0.0_r1806.g436fdfd0
pkgrel=2
pkgdesc='Support for downloading application assets from the network'
arch=($CARCH)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(attica-git gcc-libs glibc karchive-git kconfig-git kcoreaddons-git ki18n-git kpackage-git kwidgetsaddons-git qt6-base syndication-git)
makedepends=(git doxygen extra-cmake-modules-git qt6-declarative qt6-doc qt6-tools)
optdepends=('kirigami-git: QML components'
            'knewstuff-git: QML components'
            'qt6-5compat: QML components'
            'qt6-declarative: QML components')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
