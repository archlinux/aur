# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.4.1
pkgrel=1
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
b2sums=('b84627f6a5b204255954500e13ba45a74444f85d65412b31b0887d1003437d38f823ccc981baad9e437c32195ba50055e0bf541569b155a3da9f3582a6d579cb')

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
