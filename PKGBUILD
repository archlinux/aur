pkgname=spotifyd
pkgver=42.73458a2
pkgrel=1
arch=('x86_64')
depends=('pulseaudio' 'flac' 'libogg' 'libpulse' 'libsndfile' 'libvorbis')
makedepends=('git' 'cargo')
conflicts=('spotifyd-bin')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/spotifyd"
source_x86_64=("spotifyd::git+https://github.com/Spotifyd/spotifyd" "spotifyd.service")
md5sums_x86_64=('SKIP'
                'eb95cf4735565e0c596d7e0118fd1e6e')
pkgver() {
	cd $srcdir/spotifyd;
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/spotifyd;
  cargo build --release --features "pulseaudio"
}

package() {
  install -D -m 755 $srcdir/spotifyd/target/release/spotifyd "${pkgdir}/usr/bin/spotifyd"
  install -D -m 644 "${srcdir}/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
