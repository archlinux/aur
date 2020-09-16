# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=frankenwm
_gitname="FrankenWM"
pkgver=1.0.22
pkgrel=1
pkgdesc="Fast dynamic tiling window manager based on monsterwm-xcb"
url="https://github.com/sulami/FrankenWM"
arch=('i686' 'x86_64')
license=('custom:MIT/X')
depends=('libx11' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
conflicts=("$pkgname-git")
install=frankenwm.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bea5cbc94b34f3d55c7b9721906b7599fe3e8cfb93ce5f4727fc2f699db716eaa419865d611e4a68e9a63916b2c3a41196653d660b8672149e085d4c51d1cf83')

prepare() {
  cd "$_gitname-$pkgver"
  mv config.def.h config.h
}

build() {
  cd "$_gitname-$pkgver"
  make
}

package() {
  cd "$_gitname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
