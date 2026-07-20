# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=waybar-weather-cffi
pkgver=1.0.0
pkgrel=1
pkgdesc='waybar CFFI plugin for weather (condition icon + temperature, hourly/daily popover)'
arch=('x86_64')
url='https://github.com/asteroidzman/waybar-weather'
license=('MIT')
depends=('waybar' 'gtk3' 'glib2' 'json-glib' 'gtk-layer-shell' 'curl')
makedepends=('pkgconf' 'git')
# pkgname (waybar-weather-cffi) doesn't match the repo's own name
# (waybar-weather -- the plain "waybar-weather" AUR name was already taken
# by an unrelated package) so alias the source dir to $pkgname explicitly.
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr/lib/waybar DATADIR=/usr/share/waybar-weather install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
