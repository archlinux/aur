# Merged with official ABS kget PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kget-git
pkgver=21.11.70_r3120.g6ad6fe8c
pkgrel=1
pkgdesc='Download Manager'
url='https://apps.kde.org/kget/'
arch=($CARCH)
license=(GPL LGPL FDL)
groups=(kde-applications-git kde-network-git)
depends=(qca-qt5-git qgpgme plasma-workspace-git kdelibs4support-git)
makedepends=(git extra-cmake-modules-git boost libktorrent-git libmms kdoctools-git kdesignerplugin-git kinit-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
optdepends=('libktorrent-git: torrent support' 'libmms: MMS support')
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
