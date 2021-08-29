# Merged with official ABS dolphin-plugins PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-plugins-git
pkgver=21.11.70_r601.g04ae4bf
pkgrel=1
pkgdesc='Extra Dolphin plugins'
arch=($CARCH)
url='https://apps.kde.org/dolphin_plugins/'
license=(LGPL)
depends=(dolphin-git)
makedepends=(git extra-cmake-modules-git ktexteditor-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('ktexteditor-git: Mercurial plugin')
groups=(kde-applications-git kdesdk-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
