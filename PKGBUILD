# Maintainer: gbr <gbr@protonmail.com>
pkgname=rsmixer
pkgver=0.5.5
pkgrel=1
pkgdesc='A PulseAudio volume mixer for the command line'
arch=('x86_64')
url='https://github.com/jantap/rsmixer'
license=('MIT')
depends=('pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a7504aed55d64822ce2211160935186da545e368293189db8c7a54d4f66f2fde6159d497159fc64b9c77ca1d963ed21d92ce28a8131c6d3830f8223e707b006c')

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

