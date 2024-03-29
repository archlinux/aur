# Maintainer: kojq <kojq@mailfence.com>

pkgname=gensoquote-git
_pkgname=gensoquote
pkgver=0.3.0.r4.gf46072a
pkgrel=1
pkgdesc='Like fortune, but in Gensokyo and memory safe™'
url=https://github.com/dmyTRUEk/gensoquote
source=(git+https://github.com/dmyTRUEk/gensoquote)
license=(MIT)
arch=(x86_64)
makedepends=(cargo git)
conflicts=(gensoquote gensoquote-bin)
provides=(gensoquote)
sha256sums=(SKIP)

prepare() {
  cd $_pkgname
  cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/.*v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  CARGO_INCREMENTAL=0 cargo build --frozen --release
}

check() {
  cd $_pkgname
  cargo test --frozen --release
}

package() {
  cd $_pkgname
  install -Dm755 -t $pkgdir/usr/bin target/release/gensoquote
}
