# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=fermyon-spin
_realname=spin
pkgver=1.2.1
pkgrel=1
pkgdesc='an open source framework for building and running fast, secure, and composable cloud microservices with WebAssembly'
arch=('x86_64')
url="https://github.com/fermyon/spin"
license=('APACHE')
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('cargo')
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

sha256sums=('b56918098b9710a2f8a4b3d94b1cf1129fcd51247ba69cf8799cc90ca73e992a')
