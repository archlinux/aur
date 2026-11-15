# Prebuilt multi-arch AUR PKGBUILD template for Koma.
# shellcheck shell=bash
pkgname=koma-bin
pkgver='0.0.1'
pkgrel=1
pkgdesc='Wayland tiling compositor with explicit desktop automation interfaces (prebuilt release binaries)'
arch=('x86_64' 'aarch64')
url='https://komawm.org'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libdrm' 'libinput' 'libxkbcommon' 'mesa' 'seatd' 'systemd-libs' 'libglvnd' 'wayland')
optdepends=('xwayland-satellite: X11 client support' 'xdg-desktop-portal-gnome: screencast and file portals' 'polkit: VT switching under systemd-logind without seatd' 'jiku: optional desktop orchestration companion daemon')
provides=('koma')
conflicts=('koma')
options=('!debug' '!strip')
source_x86_64=("koma-${pkgver}-x86_64.tar.zst::https://cdn.komawm.org/releases/koma/v0.0.1/koma-${pkgver}-x86_64-unknown-linux-gnu.tar.zst")
source_aarch64=("koma-${pkgver}-aarch64.tar.zst::https://cdn.komawm.org/releases/koma/v0.0.1/koma-${pkgver}-aarch64-unknown-linux-gnu.tar.zst")
sha256sums_x86_64=('13bcefd65191cbf6bb364c60c7ea53b9903f1a98a141fc283756f5557e224e0c')
sha256sums_aarch64=('74e9d031ddc2f6a81406f9b34140ca34f8061689dc02723934a0dc0b59ff9bb6')

package() {
    cd "koma-${pkgver}-${CARCH}-unknown-linux-gnu" || return 1
    install -Dm755 bin/koma "$pkgdir/usr/bin/koma"
    install -Dm755 bin/komactl "$pkgdir/usr/bin/komactl"
    install -Dm755 bin/koma-mcp "$pkgdir/usr/bin/koma-mcp"
    install -Dm755 bin/koma-overview "$pkgdir/usr/bin/koma-overview"
    install -Dm755 resources/koma-session "$pkgdir/usr/bin/koma-session"
    install -Dm644 resources/koma.desktop "$pkgdir/usr/share/wayland-sessions/koma.desktop"
    install -Dm644 resources/koma.service "$pkgdir/usr/lib/systemd/user/koma.service"
    install -Dm644 resources/koma-shutdown.target "$pkgdir/usr/lib/systemd/user/koma-shutdown.target"
    install -Dm644 resources/koma-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/koma-portals.conf"
    install -Dm644 resources/greetd-config.toml "$pkgdir/usr/share/doc/koma/examples/greetd-config.toml"
    install -Dm644 examples/init.lua "$pkgdir/usr/share/doc/koma/examples/init.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/koma/LICENSE"
}
