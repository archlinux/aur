# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=rust-anything-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Incrementally port applications to Rust and verify them against recorded behavior'
arch=('x86_64' 'aarch64')
url='https://github.com/erkamyaman/rust-anything'
license=('MIT')
depends=('glibc>=2.34' 'libgcc')
optdepends=(
  'rust: build Rust ports and run gate checks with Cargo, rustfmt, and Clippy'
  'nodejs: record JavaScript and TypeScript behavior'
  'python: run the Python and C recording and replay harnesses'
  'gcc: compile C originals for recording'
  'go: record Go behavior'
  'ruby: record Ruby behavior'
  'java-environment: provide javac and java for the Java harness'
)
provides=("rust-anything=$pkgver")
conflicts=('rust-anything')
options=('!strip' '!debug')
_asset="rust-anything-v${pkgver}"
_release="$url/releases/download/v$pkgver"
source_x86_64=("$_release/$_asset-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_release/$_asset-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('52145ac76f4cfe3beff25c66d7d129a6e791b31a43f8d36cef3a49083d20a8a9')
sha256sums_aarch64=('7bde02f15cf1009acef5d1bb1c14b5002a6c727a2216f4316f20074f0ed87ec6')

package() {
  cd "$srcdir/$_asset-$CARCH-unknown-linux-gnu"
  install -Dm755 rust-anything "$pkgdir/usr/bin/rust-anything"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}
