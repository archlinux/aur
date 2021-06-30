# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=fnott
pkgver=1.1.0
pkgrel=1
pkgdesc="Keyboard driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'tllist>=1.0.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5ec6318dfa3030841a0c932255a9680e357a583c913d1f5d8770f665458751bb2c23cad268ecae64fe148fc36798fb882b59b0e85ed42594b9a4b5863af7d8f4')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir/" meson install -C build
  install -Dm 644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
