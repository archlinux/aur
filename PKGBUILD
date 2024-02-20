# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=purpose-git
_name=${pkgname/-git}
pkgver=r1232.68918bd6
pkgrel=1
pkgdesc="Framework for providing abstractions to get the developer's purposes fulfilled"
arch=(x86_64)
url='https://projects.kde.org/projects/playground/libs/purpose'
license=('CC0-1.0' 'LGPL-2.1-or-later')
depends=(kio-git kaccounts-integration-git kirigami2-git accounts-qml-module prison-git)
makedepends=(extra-cmake-modules-git git python intltool kdeclarative-git qt6-multimedia)
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
