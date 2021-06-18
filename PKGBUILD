# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.2.0
pkgrel=2
pkgdesc="Open source client library for Spotify"
arch=(x86_64 aarch64)
url="https://github.com/librespot-org/librespot"
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
sha256sums=('cd6e7ae63583584598dead53b5e8e4077ab37df6e3b59c2a7416459b9a649fc3')

build() {
	return 0
}

package() {
	cd "${pkgname}-${pkgver}"
	cargo install --no-track --locked --all-features --root "${pkgdir}/usr/" --path .
	install -Dm644 contrib/librespot.service ${pkgdir}/usr/lib/systemd/system/librespot.service
	# install -Dm644 contrib/librespot.user.service ${pkgdir}/usr/lib/systemd/user/librespot.user.service
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
