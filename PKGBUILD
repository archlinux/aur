# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Alexander Schäferdiek <alexander@schaeferdiek.eu>
# Contributor: Florian Klink <flokli@flokli.de>

pkgname=spotifyd
pkgver=0.2.1
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('flac' 'libogg' 'libsndfile' 'libvorbis')
makedepends=('git' 'cargo')
conflicts=('spotifyd-bin' 'spotifyd-git')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6e092b7e78c42fc2a4865b6b8571b71b63acc3d8941e15250e1f033508b151e1')

build() {
  cd "$srcdir/spotifyd-$pkgver"
  cargo build --release
}

package() {
  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgname-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
  install -D -m 644 "$srcdir/$pkgname-$pkgver/contrib/spotifyd.service" "$pkgdir/usr/lib/systemd/user/spotifyd.service"
}
