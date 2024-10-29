# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=spotify-player-full
_pkgname=spotify-player
pkgver=0.20.0
pkgrel=1
pkgdesc="A command driven spotify player with all options enabled"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('openssl' 'dbus' 'libsixel' 'libpulse' 'glibc' 'gcc-libs')
conflicts=("${_pkgname}" "${pkgname}-git")
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('61b34efaa86c7fe4a4f8068b7b18f6480061834b33a32eefb8ce0531810bc33950285cc052454c27edd0e73704ebd34d1f6a4e5467d555dc041f90453de55384')
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
