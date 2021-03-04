# Maintainer: lmartinez-mirror
pkgname=fnott
pkgver=1.0.1
pkgrel=2
pkgdesc="Keyboard driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'tllist>=1.0.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5f8c3ba29af792875b0ac2e585cfebd453c92be064711b9d82a5cf6249fccda2cdeacc2a96b0b8b4a485590f10255d3e257339d85c99cccc3158ebc516959f22')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir/" meson install -C build
  install -Dm 644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
