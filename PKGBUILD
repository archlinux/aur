# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=spotify-player-full-pipe
pkgver=0.19.1
pkgrel=1
pkgdesc="A terminal Spotify player - compiled with pulse/pipewire, lyrics, and image support"
arch=('x86_64')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'dbus' 'libxcb' 'pipewire-pulse')
makedepends=('cargo')
conflicts=('spotify-player')
source=("spotify-player-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=('!lto')

build() {
	cd "spotify-player-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --release --no-default-features --locked \
  --features pulseaudio-backend,lyric-finder,media-control,sixel,streaming,notify,daemon,image,fzf
}

package() {
	cd "spotify-player-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
