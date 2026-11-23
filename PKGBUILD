# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=rust-anything-bin
pkgver=3.3.0
pkgrel=1
pkgdesc='Incrementally port applications to Rust and verify them against recorded behavior'
arch=('x86_64' 'aarch64')
url='https://github.com/erkamyaman/rust-anything'
license=('MIT')
depends=('glibc>=2.34' 'libgcc')
optdepends=(
  'rust>=1:1.97: build Rust ports and run gate checks with Cargo, rustfmt, and Clippy'
  'nodejs>=22.6: record JavaScript and TypeScript behavior (profiling requires Node.js 24 or newer)'
  'python>=3.9: run the Python and C recording and replay harnesses'
  'gcc: compile C originals for recording'
  'go>=1.22: record Go behavior'
  'ruby>=3: record Ruby behavior'
  'java-environment>=17: provide javac and java for the Java harness'
  'kotlin: compile Kotlin originals for recording and replay'
  'php>=8: run the PHP recording and replay harness'
  'dotnet-sdk: build and run the C# recording and replay harness'
  'wasm-bindgen: build WebAssembly bindings (must match the port’s locked crate version)'
  'android-tools: provide adb for Android on-device recording and replay'
)
provides=("rust-anything=$pkgver")
conflicts=('rust-anything')
options=('!strip' '!debug')
_asset="rust-anything-v${pkgver}"
_release="$url/releases/download/v$pkgver"
source_x86_64=("$_release/$_asset-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$_release/$_asset-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e0b3456a9b1a6ae2f1205397815f21f3797be1e3ca505985d5ae9e054ee5dcc0')
sha256sums_aarch64=('a56790fbc6a0615deb969b272ce53114d66032da462f061818cf6206513d4b02')

package() {
  cd "$srcdir/$_asset-$CARCH-unknown-linux-gnu"
  install -Dm755 rust-anything "$pkgdir/usr/bin/rust-anything"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}
