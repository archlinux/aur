# Maintainer: ALX99 <46844683+ALX99@users.noreply.github.com>

pkgname=river-creek-git
_pkgname=creek
pkgver=0.4.2.r0.g2c851d8
pkgrel=1
pkgdesc='A malleable and minimalist status bar for the River compositor'
arch=('x86_64')
url='https://github.com/nmeum/creek'
license=('MIT')
depends=('wayland' 'river')
makedepends=('zig>=0.13.0' 'zig<0.14.0' 'git' 'wayland-protocols' 'pixman' 'fcft')
provides=('creek')
conflicts=('river-creek')
source=("git+https://github.com/nmeum/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  git -C "$_pkgname" describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  zig build --release=safe
}

check() {
  cd "$_pkgname"
  test -r zig-out/bin/creek
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" zig build --release=safe --prefix '/usr'
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
