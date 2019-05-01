# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=swaybg
pkgver=0+93+cf62ace
_commit=cf62ace04b82eaf7ad05c55639d1fd04e8380f2a
pkgrel=1
pkgdesc='Wallpaper tool for Wayland compositors'
arch=(x86_64)
url=https://github.com/swaywm/swaybg
license=(MIT)
depends=(wayland cairo)
makedepends=(git meson ninja scdoc wayland-protocols)
optdepends=('gdk-pixbuf2: for images in formats other than PNG')
conflicts=(swaybg-git)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd swaybg
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  mkdir build
  arch-meson build swaybg -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 swaybg/LICENSE -t "$pkgdir"/usr/share/licenses/swaybg
}

# vim: ts=2 sw=2 et
