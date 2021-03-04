# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kirigami-addons-git
pkgver=r25.2fb3fb1
pkgrel=1
pkgdesc="Add-ons for the Kirigami framework"
arch=(x86_64)
url="https://invent.kde.org/libraries/kirigami-addons"
license=(GPL3)
depends=(ki18n kirigami2)
makedepends=(git extra-cmake-modules)
provides=(kirigami-addons)
conflicts=(kirigami-addons)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%-git}"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
