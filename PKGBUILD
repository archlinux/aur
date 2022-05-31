# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.1.0
pkgrel=1
pkgdesc='Ferium is an easy to use CLI program for downloading and updating Minecraft mods from Modrinth, CurseForge, and GitHub Releases.'
url='https://github.com/theRookieCoder/ferium'
license=('MPL2')
arch=(x86_64)
depends=(gcc-libs bzip2)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c49e6a26335b15491c67bf125f7c1e72f381436bd3479da85b06cfec8662d52')
b2sums=('18fe4c4d958436b6c96aca8eb266fdfbd1d1aa0ae20bd841bb0cd66262530eb6e69be81e36eccda0bb9c6eac5f6e4596a8ee86d6d7badccdf7ed5f34840e238b')

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
