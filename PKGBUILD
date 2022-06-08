# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.1.2
pkgrel=1
pkgdesc='Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases.'
url='https://github.com/theRookieCoder/ferium'
license=('MPL2')
arch=(x86_64)
depends=(gcc-libs bzip2)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18effcca12a75a7e2677ab9a1382c86250f1dd2672487bc3be39ffb50befaec5')
b2sums=('578906fe313dc275eea53b8b2b8a8721f444eec5899711e26269dae61cb59def6bdc1f904de9ec9fa04641a59c4474bce6f8ebf4c6717eaa7c29805c71170fd1')

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
