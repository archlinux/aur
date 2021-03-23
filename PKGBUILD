# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish-git
pkgver=r855.5869f59
pkgrel=1
arch=('x86_64')
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2' 'qt5-feedback')
makedepends=('extra-cmake-modules' 'git' 'corrosion-git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd angelfish
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd angelfish
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd angelfish
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

#vim: syntax=sh
