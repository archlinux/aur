# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.3.0
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
sha256sums=('8aacef6e94fa0fc9e23bf7b2fe762c6c2301bb5c58c24f9710dc789a7050216e'
            'd73c13c6966f2915cb23fb2e944c682dd0b3b86ad1d828a76a433a00a46585fb')

package() {
    install -Dm755 "${srcdir}/dshub" "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"
    install -Dm644 packaging/dshub.desktop \
        "${pkgdir}/usr/share/applications/dshub.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
