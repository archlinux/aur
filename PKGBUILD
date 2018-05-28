# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Alexander Schäferdiek <alexander@schaeferdiek.eu>
# Contributor: Florian Klink <flokli@flokli.de>

pkgname=spotifyd
pkgver=0.2
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('flac' 'libogg' 'libsndfile' 'libvorbis')
makedepends=('git' 'cargo')
conflicts=('spotifyd-bin' 'spotifyd-git')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Spotifyd/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('090be5990fbe6db9cc47d827e8c73d155cb442932eea23e227d8ff2474b531b8')

build() {
  cd "$srcdir/spotifyd-$pkgver"
  cargo build --release
}

package() {
  cargo install --root "$pkgdir/usr" --path "$srcdir/$pkgname-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
  install -D -m 644 "$srcdir/$pkgname-$pkgver/contrib/spotifyd.service" "$pkgdir/usr/lib/systemd/user/spotifyd.service"
}
