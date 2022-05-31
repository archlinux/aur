# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.1.1
pkgrel=1
pkgdesc='Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases.'
url='https://github.com/theRookieCoder/ferium'
license=('MPL2')
arch=(x86_64)
depends=(gcc-libs bzip2)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f651b1b0fb271c2f5ae390f8088e7d1bf147be25651668621a97adf21126c77c')
b2sums=('58700c1eda089c3ab356d7a090fc48251035dc62cf46725f1969d008b0b3f32b18e6c51837de2f06c5ff700c228ac11b626d1ee6624850fea470af47608c33bc')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/ferium

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
