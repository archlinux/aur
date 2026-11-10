# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.3.1
pkgrel=1
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
sha256sums=('aad88b6e4f0cacf461464dc8ed9bc828ab5ddea43a7a6cffaa525dc5ec70252d'
            '69460062c4ffe82d420e122a78bfe21dba0e8af5f3df2e9499a0a382e49e6519')

package() {
    install -Dm755 "${srcdir}/dshub" "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"
    install -Dm644 packaging/dshub.desktop \
        "${pkgdir}/usr/share/applications/dshub.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
