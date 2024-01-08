# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Chris Down <chris@chrisdown.name>

pkgname=udp-over-tcp
pkgver=0.4.0
pkgrel=1
pkgdesc="Proxy UDP traffic over a TCP stream"
arch=('i686' 'x86_64')
url="https://github.com/mullvad/udp-over-tcp"
license=('apache' 'MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust')
source=("https://github.com/mullvad/udp-over-tcp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0338b65bd979ec6ccd50e6d7642fc371bed9ea2c173a54cdd98af1ca3b25f2d0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
  cargo fetch \
  --locked \
  --target "$CARCH-unknown-linux-gnu"

}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  CARGO_TARET_DIR=target \
  RUSTUP_TOOLCHAIN=stable \
  cargo \
  build \
  --frozen \
  --release \
  --all-features

}

package() {
  cd "$srcdir"/udp-over-tcp-"$pkgver"

  RUSTUP_TOOLCHAIN=stable cargo install \
    --all-features \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path .
}
