# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=netpanzer
pkgver=0.9.1
pkgrel=1
pkgdesc="An online multiplayer tactical warfare game designed for fast action combat"
url="https://github.com/netpanzer/netpanzer"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
depends=('lua51' 'physfs' 'sdl2' 'sdl2_ttf' 'sdl2_mixer' 'hicolor-icon-theme')
makedepends=('meson')
conflicts=('netpanzer-appimage')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7556c1c3f69934380d6e6a8be5e11e4b881bd67399896db416b27329d6d21b81')

build() {
    arch-meson "${pkgname}-${pkgver}" build \
        -Db_sanitize=none \
        -Dbuild_tests=false \
        -Ddocdir="share/doc/${pkgname}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/support/win32/${pkgname}.desktop" \
        -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
}
