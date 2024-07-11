# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=fermyon-spin
_realname=spin
pkgver=2.6.0
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

sha256sums=('dfd921bdbfe579a3d1959b1c960bdef2545240967d60407eb6238563876dc401')
