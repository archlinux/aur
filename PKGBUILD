# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.3.1
pkgrel=1
pkgdesc='Open source client library for Spotify'
arch=(x86_64 aarch64)
url='https://github.com/librespot-org/librespot'
license=(MIT)
depends=(
	libpulse
	alsa-lib
	jack
	avahi
	gst-plugins-base-libs
	portaudio
	sdl2
)
makedepends=(
	cargo
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d360eaf61ad4216ee2c4a4d583d61c8ec7367b5efbe512011d049f73e4f24952')

build() {
	return 0
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --all-features --root "${pkgdir}/usr/" --path .
	install -Dm644 contrib/librespot.service "${pkgdir}/usr/lib/systemd/system/librespot.service"
	install -Dm644 contrib/librespot.user.service "${pkgdir}/usr/lib/systemd/user/librespot.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
