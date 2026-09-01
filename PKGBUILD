# Maintainer: mryll <https://github.com/mryll>
pkgname=printbar-bin
pkgver=0.5.2
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
sha256sums=('dceb74d4c942ed1a0564926fba4640679b04dfcc1239efb2acf06a0dec54f274'
            'a4e976ad8eb483c5ae9933fe5b985d30e3618c355a86899e52c355593fac89c9'
            '584e3279c3b85cd466c87bcb8f7e133f66e763fa0e563f90853d7c282bcc7731'
            '42134e86e6ab2f76204eaa113b1450c067a003990169dd23509e733c2aedfa92'
            'aa9f3a694508cadff239e4694992eac66611723af6ce8643e80ca5c7db8c9e4e')

package() {
    install -Dm755 "printbar-${pkgver}" "$pkgdir/usr/bin/printbar"
    install -Dm755 "printbar-watch-${pkgver}" "$pkgdir/usr/bin/printbar-watch"
    sed 's|@BIN@|/usr/bin|' "printbar-watch.service-${pkgver}" > "$srcdir/svc.pkg"
    install -Dm644 "$srcdir/svc.pkg" "$pkgdir/usr/lib/systemd/user/printbar-watch.service"
    install -Dm644 "config.example.toml-${pkgver}" "$pkgdir/usr/share/printbar/config.example.toml"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
