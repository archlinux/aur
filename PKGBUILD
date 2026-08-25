# Maintainer: mryll <https://github.com/mryll>
pkgname=printbar-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Generic printer monitor for Waybar (IPP + SNMP + CUPS) — supplies, trays, jobs, panel text; instant push on print; Omarchy theming (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mryll/printbar'
license=('MIT')
depends=('gcc-libs')
optdepends=('cups: CUPS source, queue action and the instant-push service'
            'libnotify: desktop notifications'
            'xdg-utils: open the EWS / queue on click'
            'ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (tooltip_font)')
provides=('printbar')
conflicts=('printbar')
options=(!debug)
source=("printbar-${pkgver}::https://github.com/mryll/printbar/releases/download/v${pkgver}/printbar-${pkgver}-x86_64-linux"
        "printbar-watch-${pkgver}::https://raw.githubusercontent.com/mryll/printbar/v${pkgver}/printbar-watch"
        "printbar-watch.service-${pkgver}::https://raw.githubusercontent.com/mryll/printbar/v${pkgver}/printbar-watch.service"
        "config.example.toml-${pkgver}::https://raw.githubusercontent.com/mryll/printbar/v${pkgver}/config.example.toml"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/printbar/v${pkgver}/LICENSE")
sha256sums=('7ecacdf5873139264d4c8815aa616030548f400df765fda56459c330146a4aae'
            'cbb2d29d6be632517e566b14ca44033e3209f15047d715d6a2e0e86d95aca95f'
            '584e3279c3b85cd466c87bcb8f7e133f66e763fa0e563f90853d7c282bcc7731'
            '221cbb38b324a958cbc487ad49adb5febf403d5da80f1a0b74f72df12f54f23d'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "printbar-${pkgver}" "$pkgdir/usr/bin/printbar"
    install -Dm755 "printbar-watch-${pkgver}" "$pkgdir/usr/bin/printbar-watch"
    sed 's|@BIN@|/usr/bin|' "printbar-watch.service-${pkgver}" > "$srcdir/svc.pkg"
    install -Dm644 "$srcdir/svc.pkg" "$pkgdir/usr/lib/systemd/user/printbar-watch.service"
    install -Dm644 "config.example.toml-${pkgver}" "$pkgdir/usr/share/printbar/config.example.toml"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
