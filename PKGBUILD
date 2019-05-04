# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=swaybg
pkgver=1.0
pkgrel=1
pkgdesc='Wallpaper tool for Wayland compositors'
arch=(x86_64)
url=https://github.com/swaywm/swaybg
license=(MIT)
depends=(wayland cairo)
makedepends=(meson ninja scdoc wayland-protocols)
optdepends=('gdk-pixbuf2: for images in formats other than PNG')
conflicts=(swaybg-git 'sway<1.1')
source=($url/archive/$pkgver.tar.gz)
sha512sums=('67d0e0109b906ece51800729182940374cc59fa07d0866b57cf876d12191fe12e796b84350a849dc85183fa58a3b2d196191e48dcc03dcc3708a980ed4a8cff0')

build() {
  rm -rf build
  mkdir build
  arch-meson build swaybg-$pkgver -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 swaybg-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/swaybg
}
