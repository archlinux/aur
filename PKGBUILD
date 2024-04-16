# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=fermyon-spin
_realname=spin
pkgver=2.4.2
pkgrel=1
pkgdesc='an open source framework for building and running fast, secure, and composable cloud microservices with WebAssembly'
arch=('x86_64')
url="https://github.com/fermyon/spin"
license=('APACHE')
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('cargo' 'cmake')
source=("${_realname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

prepare() {
  cd $_realname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_realname-$pkgver
  export RUSTUP_TOOLCHAIN=stable

  cargo build --frozen --release --bin spin
}

package() {
  install -Dm755 $_realname-$pkgver/target/release/$_realname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $_realname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('5017b5387c1db780744ac5bf643d6c5632c84cc80c807a5b6cc62ca41238e28a')
