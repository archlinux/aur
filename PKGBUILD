# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=spotify-player-full
_pkgname=spotify-player
pkgver=0.20.4
pkgrel=1
pkgdesc="A command driven spotify player with all options enabled"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('openssl' 'dbus' 'libsixel' 'libpulse' 'glibc' 'gcc-libs')
conflicts=("${_pkgname}" "${pkgname}-git")
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('a867a458aa490f188fb9759e6f6543f7d02c64f48f4b30c43e60a6146389438bb5f35df0c27dbd81e095c2c3deef7fe26d9cb7e4d1b6f3cae42a8028d180ae21')
options=('!lto')

build() {
	cd "${_pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked --no-default-features \
		 --features notify,pulseaudio-backend,media-control,daemon,image,sixel,fzf
}

package() {
	cd "${_pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
