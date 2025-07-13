# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=bawa-git
_pkgname=bawa
pkgver=v0.1.0.r12.g8ab5f96
pkgrel=1

pkgdesc='A TUI game save organizer'
url='https://github.com/sarowish/bawa'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/sarowish/bawa')
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
