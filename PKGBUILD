# Maintainer: gbr <gbr@protonmail.com>
pkgname=rsmixer
pkgver=0.5.3
pkgrel=1
pkgdesc='A PulseAudio volume mixer for the command line'
arch=('x86_64')
url='https://github.com/jantap/rsmixer'
license=('MIT')
depends=('pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6387406aa247e3270e3365aef56fb6c82f7b3582d98af7bf81e4762f7d17f8f4e581235da65356f4856eef85150b6ce9f82f2b97012ded6aee3bedad3aeaae29')

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

