# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=calibre-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="A TUI application to search and open books in your Calibre library."
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/calibre-tui"
license=('MIT')
depends=('xdg-utils' 'sqlite')
makedepends=('rust')
# This package provides and conflicts with the -git version
provides=("$pkgname-git")
conflicts=("$pkgname-git")
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  # Using --locked guarantees that dependencies match Cargo.lock
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "preset/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
