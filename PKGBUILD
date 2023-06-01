pkgname=spotify-player-full-git
pkgver=0.14.1.r0.g77727a4
pkgrel=1
pkgdesc="A TUI spotify player. "
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
conflicts=("spotify-player")
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("$pkgname::git+$url#branch=master")
sha256sums=("SKIP")


pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${pkgname}"
	cargo build --release --locked --no-default-features \
		 --features lyric-finder,notify,pulseaudio-backend,media-control,daemon,image
}

package() {
    cd "${pkgname}"
    install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/spotify_player/LICENSE"
}
