# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.18.2
pkgrel=2
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('36eeb32d93ec78981b7caa0f0fdcd9d56706003c9e0d7959d80c501b3823d80925d11c523cc961e0c447242c399ff6226a86939cbc181c9356a3edaaf145db94')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --locked --release --bin spotify_player --no-default-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
