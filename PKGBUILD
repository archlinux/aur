# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=goku
pkgver=1.1.8
pkgrel=1
pkgdesc='HTTP load testing application'
url='https://github.com/jcaromiq/goku'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcaromiq/goku/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d03020d63d36465bda0f07b3f3790b9e33579afe176a25fd01e89e9e9d066fc1')
b2sums=('47b54fc562d5bae294c7c93281aef07e86acc2a9320c7ec80feb0788e59226cb651efd3c1a7d1d189b2b97b30beb758b5e4862b44d7e3c41b019848d19969c77')
options=(!lto)

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/goku

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
