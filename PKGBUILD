# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.3.2
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
sha256sums=('95aba7673812c07b00e3f78080de44d06ab31da37c59bca21bca756dd112b3bc'
            '2b7c642af54ce3bb6321a56518e3fa2f866985faf6f42561be7fa9029fd15e0c')

package() {
    install -Dm755 "${srcdir}/dshub" "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"
    install -Dm644 packaging/dshub.desktop \
        "${pkgdir}/usr/share/applications/dshub.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
