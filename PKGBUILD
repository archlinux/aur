# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=spotify-player-full
_pkgname=spotify-player
pkgver=0.20.1
pkgrel=1
pkgdesc="A command driven spotify player with all options enabled"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('openssl' 'dbus' 'libsixel' 'libpulse' 'glibc' 'gcc-libs')
conflicts=("${_pkgname}" "${pkgname}-git")
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('3446466c5da7062b4c5c81faf87a8c5f22eb7cce661f83158c398eb0e798b56d239eb3367b32249682f88b10ec066a963fe36f6199706d0193f4e7cf855d1959')
options=('!lto')

build() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked --no-default-features \
		 --features lyric-finder,notify,pulseaudio-backend,media-control,daemon,image,sixel,fzf
}

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
