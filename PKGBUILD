# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=sqlite-dist
pkgver=0.0.1.alpha.19
_ver=0.0.1-alpha.19
pkgrel=1
pkgdesc='A CLI tool for packing and distributing pre-compiled SQLite extensions.'
arch=('x86_64' 'aarch64')
license=()
url='https://github.com/asg017/sqlite-dist'
depends=('zstd' 'bzip2' 'gcc-libs' 'glibc')
makedepends=('rust')
options=(!strip lto)
source=("$url/archive/refs/tags/v$_ver.tar.gz")
sha256sums=('9e660b02cec0d0e0f28777bbbc0ed2a4393394a8d8d1d2e2fb592a735e865fcf')

build() {
  cd "$srcdir"/$pkgname-$_ver
  export RUSTFLAGS="$RUSTFLAGS -L/usr/lib -lzstd"
  cargo build --release --all-features
}

package() {
  cd "$srcdir"/$pkgname-$_ver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
