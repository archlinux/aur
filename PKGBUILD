# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=gcloud-ctx
pkgver=0.8.1
pkgrel=1
pkgdesc='Manage Google Cloud Platform gcloud configurations easily and quickly'
url='https://github.com/adamrodger/gcloud-ctx'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver::https://github.com/adamrodger/gcloud-ctx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cde98e93eccf5f747e189ab5d7a1b2034f47e8610ee72fc34418a3529f6c050b')
_shortname=gctx

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --workspace
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_shortname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
