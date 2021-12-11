# Maintainer:  (maturain) <maturain@gmail.com>
pkgname=wayland-info-git
pkgver=r43.f7f4e42
pkgrel=3
pkgdesc="Wayland tools to display information about current compository"
url="https://gitlab.freedesktop.org/ofourdan/wayland-info"
arch=(x86_64)
license=(MIT)
depends=(wayland wayland-protocols)
makedepends=(meson git)
source=("git+https://gitlab.freedesktop.org/ofourdan/wayland-info.git")
sha256sums=('SKIP')

pkgver() {
  cd wayland-info 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wayland-info build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
