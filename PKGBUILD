# Mainteiner: Richard Lees <git zero at bitservices dot io>
###############################################################################

_pkgname=spotify-player

###############################################################################

pkgname=${_pkgname}-gstreamer
pkgver=0.21.2
pkgrel=2
pkgdesc="A command driven spotify player with gstreamer (pipewire native, no pulse-audio) backend."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
options=(!lto)
provides=('spotify-player')
depends=('dbus'
         'glibc'
         'gst-plugins-base'
         'openssl')
makedepends=('cargo'
             'gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('63fce17376105ba57a3a20d9e237141dfe655a4df606d6cd666a6cdd485f2f24')

###############################################################################

build() {
    cd "${_pkgname}-${pkgver}"
    cargo build --release --no-default-features --locked --features gstreamer-backend,media-control,sixel,notify
}

###############################################################################

package() {
    install -Dm755 "${_pkgname}-${pkgver}/target/release/spotify_player" -t "${pkgdir}/usr/bin"
    install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

###############################################################################
