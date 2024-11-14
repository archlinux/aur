# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=fermyon-spin
_realname=spin
pkgver=3.0.0
pkgrel=1
pkgdesc='an open source framework for building and running fast, secure, and composable cloud microservices with WebAssembly'
arch=('x86_64')
url="https://github.com/fermyon/spin"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("${_realname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
options=("!debug")

prepare() {
  cd $_realname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_realname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  # clear CFLAGS for the build was failing
  export CFLAGS=""
  cargo build --frozen --release --bin spin
}

package() {
  install -Dm0755 $_realname-$pkgver/target/release/$_realname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('82ae05cd44f25b316a33faa706e5277e50ee5e0768ef5443be343625fc6df1a7')
