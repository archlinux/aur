# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=cage
pkgver=0.1
pkgrel=2
license=(MIT)
pkgdesc='Wayland kiosk'
url=https://hjdskes.nl/projects/cage
arch=(x86_64)
depends=(wlroots libxkbcommon xorg-server-xwayland)
makedepends=(meson ninja wayland-protocols)
conflicts=(cage-git)
source=(https://github.com/Hjdskes/cage/archive/v$pkgver.tar.gz)
sha512sums=('7c4c9d3374e05cb57d76db9d68e0919fcf6d64547d2a13f0698e4bd28d542a0ec0b96911eefda9c69dfb887ae11b91b77af19d340844642907acdd25dd1e5b4b')

build() {
  rm -rf build
  mkdir build
  arch-meson build cage-$pkgver -D werror=false -D b_ndebug=true \
    --buildtype=release \
    -Dxwayland=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 cage-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/cage
}
