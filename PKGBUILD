# Maintainer: Stipe Kotarac <stipe@kotarac.net>

pkgname=paip
pkgver=1.2.0
pkgrel=1
pkgdesc='like cat but through llm'
url='https://github.com/kotarac/paip'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(cargo)
options=(!lto)
source=("https://github.com/kotarac/paip/archive/v${pkgver}.tar.gz")
sha256sums=('e5be2b0ddffc80c443cbe02ac2be7389cce1346515bc2a3f57d9323b05e7f99d')

prepare() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver/
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd $pkgname-$pkgver/
  install -m755 -D target/release/paip $pkgdir/usr/bin/paip
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
