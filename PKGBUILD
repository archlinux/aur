# Merged with official ABS plasma-nm PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-nm-git
pkgver=5.22.80_r3051.g9005f258
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(GPL2)
depends=(plasma-workspace-git modemmanager-qt-git networkmanager-qt-git qca-git)
makedepends=(git extra-cmake-modules-git openconnect)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('openconnect: Cisco AnyConnect VPN plugin')
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
