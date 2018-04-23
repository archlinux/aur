# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Alexander Schäferdiek <alexander@schaeferdiek.eu>
# Contributor: Florian Klink <flokli@flokli.de>

pkgname=spotifyd
pkgver=0.1.1
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('flac' 'libogg' 'libsndfile' 'libvorbis')
makedepends=('git' 'cargo')
conflicts=('spotifyd-bin')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source=("spotifyd-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/archive/v$pkgver.tar.gz")
sha256sums=('4a1590acaf7417271d32c49ee835d54404a7954c6f283846f4904658b05767a4')

build() {
  cd "$srcdir/spotifyd-$pkgver"
  cargo build --release
}

package() {
  install -D -m 755 "$srcdir/spotifyd-$pkgver/target/release/spotifyd" "${pkgdir}/usr/bin/spotifyd"
  install -D -m 644 "$srcdir/spotifyd-$pkgver/contrib/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
