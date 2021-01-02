# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc
pkgver=0.4.0
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libdrm libxkbcommon aml pixman 'neatvnc>=0.4.0' wayland)
makedepends=(meson ninja scdoc)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/wayvnc/archive/v$pkgver.tar.gz")
sha512sums=('b8f1af24213077dc6126ae1f613b9cdeed8f365f9d1989a5b053563f0eb4bc49921e746e0f1026fe0e02bfeea23b912798678a5a337a052d977aa04496a75570')

build() {
  cd $pkgname-$pkgver
  arch-meson build -Dman-pages=enabled
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
