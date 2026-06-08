# Maintainer: V1lleneuve <v1lleneuve@proton.me>
pkgname=sys-shred
pkgver=1.0.0
pkgrel=1
pkgdesc="A forensic-grade, multi-threaded command-line utility for secure file erasure and anti-forensics."
arch=('x86_64' 'aarch64' 'i686' 'pentium4' 'armv7h')
url="https://github.com/v1lleneuve/sys-shred"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a844b3401b872acd9555f62565a48bebd38d1e449b6a5204204b3ee48fc55030')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install the binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install Documentation and License
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "RELEASE_NOTES.md" "$pkgdir/usr/share/doc/$pkgname/RELEASE_NOTES.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
