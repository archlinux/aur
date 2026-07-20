# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=waybar-display
pkgver=1.0.0
pkgrel=1
pkgdesc='waybar CFFI settings plugin for the asteroidz compositor (display/wallpaper popup)'
arch=('x86_64')
url='https://github.com/asteroidzman/waybar-display'
license=('MIT')
depends=('waybar' 'asteroidz' 'gtk3' 'glib2' 'json-glib' 'gtk-layer-shell')
makedepends=('pkgconf' 'git')
source=("git+$url.git#tag=$pkgver")
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
  make DESTDIR="$pkgdir" PREFIX=/usr/lib/waybar DATADIR=/usr/share/waybar-display install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
