# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.3.1
pkgrel=2
pkgdesc='Open source client library for Spotify'
arch=(x86_64 aarch64)
url='https://github.com/librespot-org/librespot'
license=(MIT)
depends=(
	libpulse
	alsa-lib
	jack
	gst-plugins-base-libs
	portaudio
	sdl2
)
makedepends=(
	cargo
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('454502af4532e729fd062075f962d07efdacc94d475a4f05461d1a2bd9c1287881c7f51884e03cd659bf3e1569db954508eafec3030e5d3dc9a789152eecaa3a')

build() {
	return 0
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --root "${pkgdir}/usr/" --path . --features \
		alsa-backend,portaudio-backend,pulseaudio-backend,jackaudio-backend,rodio-backend,rodiojack-backend,sdl-backend,gstreamer-backend
	install -Dm644 contrib/librespot.service "${pkgdir}/usr/lib/systemd/system/librespot.service"
	install -Dm644 contrib/librespot.user.service "${pkgdir}/usr/lib/systemd/user/librespot.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
