# Maintainer: zzzardoz <zzzardoz at mail dot de>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=televido
pkgver=0.5.0
pkgrel=2
pkgdesc="Access German-language public broadcasting live streams and archives on the Linux Desktop"
arch=(x86_64)
url="https://github.com/d-k-bo/${pkgname}"
license=('GPL3')
depends=(libadwaita libclapper-gtk)
optdepends=('totem: video playback'
            'celluloid: video playback'
            'clapper: video playback'
            'daikhan-git: video playback'
            'parabolic: video download')
makedepends=(
    meson
    rust
    blueprint-compiler
)
source=("https://github.com/d-k-bo/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('d9c8b99dfaa5614db96b1f64f4a4a94fbeac5d904f99eb4a6f340d81d7965968')

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}" --no-rebuild
}
