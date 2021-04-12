# Maintainer: gbr <gbr@protonmail.com>
pkgname=rsmixer
pkgver=0.3.0
pkgrel=2
pkgdesc='A PulseAudio volume mixer for the command line'
arch=('any')
url='https://github.com/jantap/rsmixer'
license=('MIT')
depends=('pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('afedfbb00d4ba3feecdceb46634757345607210e2b6f41f122888981f590ab4ff884b26d1dc1318254f23b0d6a1271650cc65f4ee521abf844b195a5b4a8127c')

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

