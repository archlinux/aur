# Maintainer: zzzardoz <zzzardoz at mail dot de>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=televido
pkgver=0.4.0
pkgrel=1
pkgdesc="Access German-language public broadcasting live streams and archives on the Linux Desktop"
arch=(x86_64)
url="https://github.com/d-k-bo/${pkgname}"
license=('GPL3')
depends=(libadwaita)
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
sha256sums=('d2bab0a83c05fb35c50f8d38be462aa2c7384340fb58ff7f8ec4d60430fc0e15')

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
