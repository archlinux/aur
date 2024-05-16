# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=spotify-player-full-pipe
pkgver=0.18.1
pkgrel=1
pkgdesc="A terminal Spotify player - compiled with pulse/pipewire, lyrics, and image support"
arch=('x86_64')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('openssl' 'alsa-lib' 'dbus' 'libxcb' 'pipewire-pulse')
makedepends=('cargo')
conflicts=('spotify-player')
source=("spotify-player-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "spotify-player-${pkgver}"

	cargo build --release --no-default-features --locked --features pulseaudio-backend,lyric-finder,media-control,sixel,streaming,notify,daemon
}

package() {
	cd "spotify-player-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
