# Maintainer: gbr <gbr@protonmail.com>
pkgname=rsmixer
pkgver=0.5.4
pkgrel=1
pkgdesc='A PulseAudio volume mixer for the command line'
arch=('x86_64')
url='https://github.com/jantap/rsmixer'
license=('MIT')
depends=('pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('84dd54cf17e39e9b8145095bb44ac71a26172d5a0c944191195ac5f967a124a1a6375aca1f5f2fd8978922757f9f1971356365b9d611ea666a2338169f84ec3e')

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

