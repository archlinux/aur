# Maintainer: DrunkLeen <snape@drunkleen.com>
pkgname=rust-bucklespring
pkgver=0.1.0
pkgrel=1
pkgdesc="Nostalgia bucklespring keyboard sound now in Rust!"
arch=('x86_64' 'aarch64')
url="https://github.com/drunkleen/rust-bucklespring"
license=('GPL-2.0 license')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=('bucklespring')
conflicts=('bucklespring')
depends=('libx11' 'libxtst' 'libxcb' 'libxext' 'libxau' 'libxdmcp' 'alsa-lib')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/rust-bucklespring" "$pkgdir/usr/bin/rust-bucklespring"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "rust-bucklespring.1" "$pkgdir/usr/share/man/man1/rust-bucklespring.1"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}