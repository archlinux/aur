# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=waybar-media-cava
pkgver=1.0.0
pkgrel=1
pkgdesc='waybar CFFI plugin combining an MPRIS media widget with a live cava audio visualizer'
arch=('x86_64')
url='https://github.com/asteroidzman/waybar-media-cava'
license=('MIT')
depends=('waybar' 'gtk3' 'glib2' 'gtk-layer-shell' 'cava' 'playerctl')
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
  make DESTDIR="$pkgdir" PREFIX=/usr/lib/waybar DATADIR=/usr/share/waybar-media-cava install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
