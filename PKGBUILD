# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=gitoxide
pkgver=0.12.0
pkgrel=1
pkgdesc="A command-line application for interacting with git repositories"
url="https://github.com/Byron/gitoxide"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Byron/gitoxide/archive/refs/tags/v$pkgver.tar.gz")
cksums=('261509832')
sha256sums=('bf41af46c6296c34b0ee37566f7b71a05bd2213b3d127b24b12fa8b740706b97')
b2sums=('1bf7ecf49e1b983b219b2576123f73a47f1d044fd5fc369e17c9b6b8aec2d6247e4024359d6b2623572ab339e4dffbdf8930655486d4843b1544a21c6a61e1ae')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --features 'max'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/gix

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE LICENSE-MIT
}
