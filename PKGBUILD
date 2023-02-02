# Maintainer: ml <>
pkgname=hurl-rs
pkgver=2.0.1
pkgrel=1
pkgdesc='HTTP Client to run and test requests'
arch=('x86_64')
url='https://github.com/Orange-OpenSource/hurl'
license=('Apache')
depends=('curl' 'libxml2')
makedepends=('cargo' 'gcc' 'python')
source=("$url"/archive/"$pkgver"/hurl-"$pkgver".tar.gz)
sha512sums=('ff0a7d83f2743ac7f9baefcbd41e489e95e59bcb004aa114989f5a8ee4a994ab0f5f04d090e07dca87a9347c711f71ee86f3b748d30da5acc090505e0b73fd45')

prepare() {
  cd hurl-"$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd hurl-"$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ./bin/release/man.sh
  ./bin/release/release.sh
}

package() {
  cd hurl-"$pkgver"
  install -Dm755 target/release/hurl{,fmt} -t "$pkgdir"/usr/bin
  install -Dm644 target/man/hurl{,fmt}.1.gz -t "$pkgdir"/usr/share/man/man1
}
