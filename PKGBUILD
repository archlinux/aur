# Maintainer: gbr <gbr@protonmail.com>
pkgname=rsmixer
pkgver=0.5.1
pkgrel=1
pkgdesc='A PulseAudio volume mixer for the command line'
arch=('x86_64')
url='https://github.com/jantap/rsmixer'
license=('MIT')
depends=('pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9a99bd585408119ebb2f14e9bffa78ffff81966849a2c9e4ecc4cf266ec51dc13f88aa4c22fb894b6d289e6136a74ce95bc9b8ed1c0de6feda03a1365697e7da')

build() {
  cd "$pkgname-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

