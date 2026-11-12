# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.3.2
pkgrel=2
pkgdesc="Native desktop application for monitoring and controlling industrial devices via TCP/UDP"
arch=('x86_64')
url="https://github.com/skjafar/dshub"
license=('MIT')
provides=('dshub')
conflicts=('dshub')
# egui/eframe (glow): OpenGL plus X11 or Wayland; file dialogs use the portal.
depends=(
    'gcc-libs'
    'glibc'
    'libgl'
    'libxkbcommon'
    'wayland'
    'libx11'
    'libxcursor'
    'libxrandr'
    'libxi'
    'xdg-utils'
)
optdepends=('xdg-desktop-portal: native file dialogs')
source=(
    "dshub-${pkgver}-linux.tar.gz::${url}/releases/download/v${pkgver}/dshub-linux.tar.gz"
    "dshub-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('0a0ec1eca2e18163570a7ed99f2a91a7485836e1fe99c665200ae0bc0ed751be'
            '8dc200232ed02e29c59110ae277c7fa4d583e49dfcf2a4561678ee584c54022c')

package() {
    install -Dm755 "${srcdir}/dshub" "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"
    install -Dm644 packaging/dshub.desktop \
        "${pkgdir}/usr/share/applications/dshub.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
