# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=televido
pkgver=0.1.3
pkgrel=1
pkgdesc="Access German-language public broadcasting live streams and archives on the Linux Desktop"
arch=(x86_64)
url="https://github.com/d-k-bo/${pkgname}"
license=('GPL3')
depends=(libadwaita)
makedepends=(
    meson
    rust
    blueprint-compiler
)
source=("https://github.com/d-k-bo/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e0b87c6200350eba9b3f07809f487c332a627b288b9a48c287bbf820c617f016')

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
