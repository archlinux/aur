# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=purpose-git
_name=${pkgname/-git}
pkgver=r206.afd8519
pkgrel=1
pkgdesc="Framework for providing abstractions to get the developer's purposes fulfilled"
arch=(x86_64)
url='https://projects.kde.org/projects/playground/libs/purpose'
license=(LGPL)
depends=(kio-git kdeclarative-git kaccounts-integration-git)
makedepends=(extra-cmake-modules-git git python intltool)
provides=(purpose)
conflicts=(purpose)
source=("git+https://github.com/KDE/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
