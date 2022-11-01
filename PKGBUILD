# Maintainer: ml <ml@visu.li>
pkgname=vanity_gpg
pkgver=0.3.2
pkgrel=1
pkgdesc='Tool for generating and filtering vanity GPG keys'
arch=('x86_64')
url='https://github.com/RedL0tus/VanityGPG'
license=('MIT')
depends=('nettle' 'bzip2')
makedepends=('cargo' 'clang' 'openssl')
source=("$url"/archive/v"$pkgver"/"$pkgname"-"$pkgver".tar.gz)
sha512sums=('1ccdb669b181da95f58ee1d5f2142f727183f193ba1013b27665ed4758adefd4bdff19d00782de782928f5e72ffa3ba2c47334c2bd9b63326fd388a551dc5d63')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

prepare() {
  cd VanityGPG-"$pkgver"
  cargo fetch --target "$CARCH"-unknown-linux-gnu
}

build() {
  cd VanityGPG-"$pkgver"
  cargo build --offline --release
}

package() {
  cd VanityGPG-"$pkgver"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
}
