# Maintainer: tosterlolz <me@toster.lol>
pkgname=clown-git
pkgver=latest
pkgrel=1
pkgdesc="Simple build automation tool using TOML (Clownfile) written in Rust (git HEAD)"
arch=('x86_64')
url="https://github.com/tosterlolz/clown"
license=('MIT')
depends=('gcc' 'cargo')
makedepends=('git')

source=("git+https://github.com/tosterlolz/clown.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/clown"
  (git describe --tags --long --match 'v*' 2>/dev/null || git rev-parse --short HEAD) \
    | sed -E 's/^v?//; s/-([0-9]+)-g/\.r\1\.g/; s/-/./g'
}

build() {
  cd "$srcdir/clown"
  cargo build --release --locked
}

package() {
  cd "$srcdir/clown"
  install -Dm755 "target/release/clown" "$pkgdir/usr/bin/clown"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
