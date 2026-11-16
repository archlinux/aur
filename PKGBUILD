# Prebuilt multi-arch AUR PKGBUILD template for Jiku.
# shellcheck shell=bash
pkgname=jiku-bin
pkgver='0.0.1'
pkgrel=1
pkgdesc='Desktop orchestration daemon, CLI/MCP controller, and SQLite FTS5 memory companion for Koma (prebuilt release binaries)'
arch=('x86_64' 'aarch64')
url='https://komawm.org/jiku/'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'ca-certificates')
optdepends=('koma: Wayland tiling compositor host' 'libnotify: desktop alert notifications' 'bubblewrap: outer filesystem sandbox')
provides=('jiku')
conflicts=('jiku')
options=('!debug' '!strip')
source_x86_64=("jiku-${pkgver}-x86_64.tar.zst::https://cdn.komawm.org/releases/jiku/v0.0.1/jiku-${pkgver}-x86_64-unknown-linux-gnu.tar.zst")
source_aarch64=("jiku-${pkgver}-aarch64.tar.zst::https://cdn.komawm.org/releases/jiku/v0.0.1/jiku-${pkgver}-aarch64-unknown-linux-gnu.tar.zst")
sha256sums_x86_64=('4d0aaf5fbca73a97c359f93b132cb93a2ccd71053e5836468e365b2c7a354f97')
sha256sums_aarch64=('8075978b06c975a2357671801d5d4b78a9b7a368c811fccce73a50684633cda2')

package() {
    cd "jiku-${pkgver}-${CARCH}-unknown-linux-gnu" || return 1
    install -Dm755 bin/jikud "$pkgdir/usr/bin/jikud"
    install -Dm755 bin/jiku "$pkgdir/usr/bin/jiku"
    install -Dm644 resources/jikud.service "$pkgdir/usr/lib/systemd/user/jikud.service"
    install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/jiku/examples/config.toml"
    install -Dm644 examples/init.lua "$pkgdir/usr/share/doc/jiku/examples/init.lua"
    install -Dm644 skills/SKILL.md "$pkgdir/usr/share/doc/jiku/skills/SKILL.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/jiku/LICENSE"
}
