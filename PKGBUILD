# Merged with official ABS bluedevil PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bluedevil-git
pkgver=6.0.80_r2886.g7533d07e
pkgrel=1
pkgdesc='Integrate the Bluetooth technology within KDE workspace and applications'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(bluez-qt-git gcc-libs glibc kcmutils-git kconfig-git kcoreaddons-git kdbusaddons-git kdeclarative-git ki18n-git kio-git kirigami-git kjobwidgets-git knotifications-git kservice-git ksvg-git kwidgetsaddons-git kwindowsystem-git libplasma-git qt6-base qt6-declarative)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('bluez-obex: file transfer'
            'pulseaudio-bluetooth: to connect to A2DP profile')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
