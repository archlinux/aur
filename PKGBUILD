# Maintainer: Brandon Doornbos <b.doornbos at pm dot me>
# Co-maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local)"
arch=('x86_64')
url="https://codeberg.org/trougnouf/cfait"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'fontconfig'              # Required by the GUI for system font discovery
    'libxkbcommon'            # Required by the GUI for keyboard handling (especially on Wayland)
    'vulkan-icd-loader'       # Required by the GUI to load Vulkan drivers for rendering
    'org.freedesktop.secrets' # Required to store the CalDAV password
)
# Optional dependencies for the GUI and specific features
optdepends=(
    'vulkan-driver: Required by the GUI for hardware-accelerated rendering'
    'wayland: Required by the GUI for Wayland session support'
    'libx11: Required by the GUI for X11 session support'
    'libxcursor: Required by the GUI for X11 cursor support'
    'libxi: Required by the GUI for X11 input devices'
    'libxrandr: Required by the GUI for X11 monitor layout support'
    'xdg-desktop-portal: Required by the GUI for the file picker (export/import)'
)

options=('!strip' '!emptydirs')
source=("https://codeberg.org/trougnouf/cfait/releases/download/v1.0.7/cfait-linux-v1.0.7.tar.xz")
sha256sums=('03de25ec9e9a2ab1d00c4c5c3aec75ef8ae64184564b0761aee10d7b482620cb')
replaces=('rustycal' 'rustache' 'fairouille')
provides=('cfait' 'cfait-gui')
conflicts=('cfait')

package() {
    cd "cfait-linux-${pkgver}"

    install -Dm755 cfait -t "${pkgdir}/usr/bin/"
    install -Dm755 cfait-gui -t "${pkgdir}/usr/bin/"
    install -Dm644 cfait.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 cfait.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
