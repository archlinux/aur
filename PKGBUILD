# Merged with official ABS bluedevil PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bluedevil-git
pkgver=5.21.80_r2238.g2de8dd48
pkgrel=1
pkgdesc='Integrate the Bluetooth technology within KDE workspace and applications'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(GPL2)
depends=(bluez-qt kdeclarative-git)
makedepends=(git extra-cmake-modules-git plasma-framework-git kded-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('pulseaudio-bluetooth: to connect to A2DP profile')
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
