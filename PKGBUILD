# Merged with official ABS plasma-browser-integration PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-browser-integration-git
pkgver=6.0.80_r1569.g57b9b6a3
pkgrel=1
pkgdesc='Components necessary to integrate browsers into the Plasma Desktop'
arch=($CARCH)
url='https://www.kde.org/plasma-desktop'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc plasma-activities-git kconfig-git kcoreaddons-git kcrash-git kdbusaddons-git kfilemetadata-git ki18n-git kio-git kjobwidgets-git kservice-git kstatusnotifieritem-git plasma-workspace-git purpose-git qt6-base)
makedepends=(git extra-cmake-modules-git)
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
    -DQT_MAJOR_VERSION=6 \
    -DINSTALL_CHROME_MANIFEST=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
