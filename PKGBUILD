# Maintainer: murkl <murkl@users.noreply.github.com>
# Stamped by tools/aur.sh at a release, which fills the placeholders.

pkgname=d2launcher
pkgver=5.0.0
pkgrel=1
pkgdesc='Median XL for Diablo II on Linux, with Wine, D2Stats and tweaks'
# The Wine it downloads is x86_64.
arch=('x86_64')
url='https://github.com/murkl/d2launcher'
license=('MIT')
# What the launcher runs, then what its Wine loads for the game: windows and
# input, OpenGL, fonts and sound. No Wine of the system, no 32-bit library.
# tools/distro-check.sh starts that Wine on these alone.
depends=(
    'bash' 'coreutils' 'curl' 'hicolor-icon-theme' 'jq' 'procps-ng' 'tar' 'unzip' 'util-linux' 'xz' 'zenity' 'zip'
    'fontconfig' 'freetype2' 'libgcc' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxrandr'
    'opengl-driver' 'systemd-libs'
)
optdepends=(
    'xdg-utils: opens the reference from the help button'
    'gamemode: gamemoderun in the launch options'
    'gamescope: gamescope in the launch options'
)
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2b33cb1e001031cd9a4ab18c660b1dba8f2d7921eb4154e5f4e3b558bf9b9580')

# What ships answers with the version it was built for.
check() {
    cd "${pkgname}-${pkgver}"
    [ "$(./d2launcher --version)" = "$pkgver" ]
}

# The launcher keeps its files beside it, as a copy unpacked by hand does.
package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 d2launcher -t "${pkgdir}/usr/share/d2launcher"
    install -Dm644 d2launcher.svg -t "${pkgdir}/usr/share/d2launcher"
    install -Dm644 tweaks/*.sh -t "${pkgdir}/usr/share/d2launcher/tweaks"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/d2launcher/d2launcher "${pkgdir}/usr/bin/d2launcher"
    install -Dm644 d2launcher.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 d2launcher.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
