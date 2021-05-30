# Merged with official ABS ksysguard PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=ksysguard-git
pkgver=5.21.80_r3503.g5b75d854
pkgrel=1
pkgdesc='Track and control the processes running in your system'
arch=($CARCH)
url='https://userbase.kde.org/KSysGuard'
license=(LGPL)
depends=(libksysguard-git kinit-git)
makedepends=(git extra-cmake-modules-git kdoctools-git networkmanager-qt-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('nvidia-utils: NVIDIA GPU usage' 'networkmanager-qt-git: improved network statistics')
groups=(plasma-git)
install=${pkgname%-git}.install
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
