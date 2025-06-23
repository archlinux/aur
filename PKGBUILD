# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=spotify-player-full
_pkgname=spotify-player
pkgver=0.20.6
pkgrel=1
pkgdesc="A command driven spotify player with all options enabled"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('openssl' 'dbus' 'libsixel' 'libpulse' 'glibc' 'gcc-libs')
conflicts=("${_pkgname}" "${pkgname}-git")
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('8b69c9f80addf42236a7e8eb4488bd4f398f6fd724a7c18ae01a4361b0010361ba3e87c9cb226d0b9d098771fe52113e0fb6a0ed536e13c0cad7db9ca4c31c07')
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
