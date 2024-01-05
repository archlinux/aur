# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ztd-git
pkgver=r413.fdbafde
pkgrel=2
pkgdesc="thermitegod spacefm dependency"
arch=(any)
url="https://github.com/thermitegod/ztd"
license=(GPL3)
depends=(spdlog openssl)
makedepends=(git meson ninja gtest)
provides=(ztd)
conflicts=(ztd)
source=("git+https://github.com/thermitegod/ztd.git")
sha256sums=('SKIP')

pkgver() {
  cd ztd
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ztd
  arch-meson build
  ninja -C build

  cd tests
  arch-meson build
  ninja -C build
}

check() {
  cd ztd/tests/build
  ./test_suite
}

package() {
  cd ztd
  DESTDIR="${pkgdir}" ninja -C build install
}
