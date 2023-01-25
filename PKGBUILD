# Maintainer:  Oleg Tsvetkov <oleg@tsvetkov.dev>
# PKGBUILD is based on one from Chaotic AUR GitHub and was published here since the actual kpipewire-git wasn't in AUR already but is required by many packages in plasma. Be free
# (all respective contributors apply herein)
# Contributor: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Henri Chain <henri@henricha.in>

pkgname=kpipewire-git
pkgver=5.28.80_r205.g67f8d36
pkgrel=1
pkgdesc="KDE Plasma Kpipewire"
arch=($CARCH)
url="https://community.kde.org/Frameworks"
license=(LGPL)
depends=(kcoreaddons-git kconfig-git ki18n-git kcodecs-git iso-codes pipewire ffmpeg libepoxy)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools qt5-wayland kwayland-git plasma-wayland-protocols-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf5-git)
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
