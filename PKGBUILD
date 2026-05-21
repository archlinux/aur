# Maintainer: WindowsKonon1337 <https://github.com/WindowsKonon1337>
pkgname=trackpointsound
pkgver=1.0.0
pkgrel=1
pkgdesc="Play a random sound when the trackpoint moves"
arch=('x86_64' 'aarch64')
url="https://github.com/WindowsKonon1337/TrackPointSound"
license=('MIT')
depends=('alsa-lib' 'systemd-libs')
makedepends=('cargo' 'pkgconf' 'systemd-libs')
source=("https://github.com/WindowsKonon1337/TrackPointSound/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4850ff39cd4b50f6e6fe15b79215190efec5862a7b6f8221c8e62b38cb97605f')
options=(!lto)
install=trackpointsound.install

build() {
  cd "TrackPointSound-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "TrackPointSound-$pkgver"
  install -Dm755 target/release/trackpointsound "$pkgdir/usr/bin/trackpointsound"
  install -dm755 "$pkgdir/usr/share/trackpointsound/audio"
  install -m644 audio/* "$pkgdir/usr/share/trackpointsound/audio/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

