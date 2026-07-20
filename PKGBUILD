# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=waybar-medication
pkgver=1.0.0
pkgrel=1
pkgdesc='waybar CFFI plugin: medication reminder widget (track doses, take/skip/snooze)'
arch=('x86_64')
url='https://github.com/asteroidzman/waybar-medication'
license=('MIT')
depends=('waybar' 'gtk3' 'glib2' 'json-glib' 'gtk-layer-shell' 'libnotify')
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
  make DESTDIR="$pkgdir" PREFIX=/usr/lib/waybar DATADIR=/usr/share/waybar-medication install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
