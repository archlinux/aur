# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=trashy
pkgver=1.0.2
pkgrel=1
pkgdesc='a cli system trash manager, alternative to rm and trash-cli'
url="https://github.com/oberblastmeister/trashy"
license=('MIT' 'Apache')
arch=('x86_64' 'aarch64')
depends_x86_64=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('345b9793c5a6f7fb6ef5cdb9e746595ff783b8578a59267cde5f34461438da46')
b2sums=('8039a8dcb6c665d8d3c7688aef3cdf516c1ff15eaea90dbcec977b1a98f1881e1e0ad5915c00e415184b840064c1c0e4e5a7a93a610f6a46436aa14a64fb300b')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/trash

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
