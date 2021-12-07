# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.3.0-beta.11
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="A simple image hosting service"
arch=('x86_64')
url="https://git.asonix.dog/asonix/pict-rs"
license=('AGPL3')
depends=('gcc-libs' 'imagemagick' 'ffmpeg' 'perl-image-exiftool')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('40513e06144b8aeee30819f7ebdc08c8c7af2a5036df37d64c6159cb84c0fddf589392dcd77e327ebad0741be1085fefaf0811fa5fe1462f1738939843af5a98')
b2sums=('c812b1fd577c30cbbe8e0302e55779ea5eea960e3b530992c663f1b4feeb29de0ac444e413b6bea61a2aee2bd569a27e9e745c80de4b1c19a42d09975fcd3d18')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
