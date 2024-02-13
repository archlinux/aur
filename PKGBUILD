# Maintainer: Aaron Cottle <a@aaroncottle.au>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ocean-sound-theme-git
pkgdesc='Ocean Sound Theme for Plasma'
pkgver=6.0.80_r98.g4b12a40
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=()
makedepends=(extra-cmake-modules-git
             qt6-base)
source=(git+https://invent.kde.org/plasma/ocean-sound-theme.git)
sha256sums=('SKIP')

conflicts=('ocean-sound-theme')
provides=('ocean-sound-theme')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ocean-sound-theme
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
