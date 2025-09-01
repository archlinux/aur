# Maintainer: ALX99 <46844683+ALX99@users.noreply.github.com>

pkgname=river-creek
_pkgname=creek
pkgver=0.4.3
pkgrel=1
pkgdesc='A malleable and minimalist status bar for the River compositor'
arch=('x86_64')
url='https://github.com/nmeum/creek'
license=('MIT')
depends=('wayland' 'river')
makedepends=('zig>=0.14.0' 'zig<0.15.0' 'git' 'wayland-protocols' 'pixman' 'fcft')
provides=('creek')
conflicts=('river-creek-git')
source=("https://github.com/nmeum/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f54e58bf50c7ce7ee702aea3066ac3d0137ef4c7c2d691f8b939a89550759c2a')

build() {
  cd "$_pkgname-$pkgver"
  zig build --release=safe
}

check() {
  cd "$_pkgname-$pkgver"
  test -r zig-out/bin/creek
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  DESTDIR="$pkgdir" zig build --release=safe --prefix '/usr'
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
