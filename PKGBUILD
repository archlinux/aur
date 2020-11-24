# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=frankenwm
_pkgname="FrankenWM"
pkgver=1.0.23
pkgrel=1
pkgdesc="Fast dynamic tiling window manager based on monsterwm-xcb"
url="https://github.com/sulami/FrankenWM"
arch=('i686' 'x86_64')
license=('custom:MIT/X')
depends=('libx11' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d2e00a35e1ba0647962de16b80aeffd2019cd22d319d9e4ab67ae06485bee612df4416ff8220a665fb6ccca8b54b516b8c0c253005b7ccfdd95f285f150ca394')

prepare() {
  cd "$_pkgname-$pkgver"
  mv config.def.h config.h
}

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
