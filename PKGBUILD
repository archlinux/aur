# Maintainer: lee <lee@yizhisec.com>
#
# Rendered by .github/workflows/release.yml — 0.1.0 / 67d17ce4cb4d033983639c708a30feb798dea6b5dc62c8a1980005c19f664ea1 are
# substituted with the tag and the checksum of the published release's
# auto-generated source tarball.
#
# Built from source rather than shipped as a prebuilt -bin package: inm links
# directly against spice-gtk and gpui's native Vulkan/Wayland/X11 bindings,
# which makes cross-compiling a portable binary far riskier than just
# building on the machine that's about to run it — and the build itself only
# takes a minute or two.

pkgname=inm
pkgver=0.1.0
pkgrel=1
pkgdesc="Native manager for Incus virtual machines with the SPICE console embedded in the app"
arch=('x86_64')
url="https://github.com/loyalpartner/inm"
license=('MIT')
depends=('spice-gtk' 'vulkan-icd-loader' 'libxkbcommon-x11')
makedepends=('cargo' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67d17ce4cb4d033983639c708a30feb798dea6b5dc62c8a1980005c19f664ea1')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
