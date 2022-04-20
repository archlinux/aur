# Maintainer: ml <ml@visu.li>
pkgname=vanity_gpg
pkgver=0.3.1
pkgrel=2
pkgdesc='Tool for generating and filtering vanity GPG keys'
arch=('x86_64')
url='https://github.com/RedL0tus/VanityGPG'
license=('MIT')
depends=('nettle' 'bzip2')
makedepends=('cargo' 'clang' 'openssl')
source=("$url"/archive/v"$pkgver"/"$pkgname"-"$pkgver".tar.gz)
sha512sums=('74a5027d5567c03eeab8b0cde3d4578155b6b7dcc6704dcf786c8b2809cdbad149438f8600c398a655a41c98d5aa674f32aa2d867b7304ac2f45d68358be42d0')

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
