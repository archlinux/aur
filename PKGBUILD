# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.3.4
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
sha256sums=('2ae14378e70ae585b90e87c6fade873ec1993761c677d6d3acd7d6ba02241fea'
            '680e0e2b426f36a72a2b789c0d6437c2c917ce2f13c3d3090017c4405b4dfed5')

package() {
    install -Dm755 "${srcdir}/dshub" "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"
    install -Dm644 packaging/dshub.desktop \
        "${pkgdir}/usr/share/applications/dshub.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
