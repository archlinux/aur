# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.3.0-beta.6
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="A simple image hosting service"
arch=('x86_64')
url="https://git.asonix.dog/asonix/pict-rs"
license=('AGPL3')
depends=('gcc-libs' 'imagemagick' 'ffmpeg' 'perl-image-exiftool')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('0047e26a3aea1d0dca22d493ecaa03797205eb727a0d5115e74eb3815ea1dc0e71583dba1e1d343aba1d162b5199cc5ed43c45084b5ce5672240749c95c7e9f1')
b2sums=('427d70120b110f736692839d85f8fa5af91c822142ffc79dab790402552eac609eac41bdbc54664146233ad9c39df94958e25c449412e23f532b1f0d7f14107f')

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
