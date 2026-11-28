# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-bin
pkgver=0.38.1
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'libcap' 'sing-box>=1.14')
optdepends=(
    'xdg-utils: open the project support page from the TUI'
    'wl-clipboard: clipboard integration on Wayland'
    'xclip: clipboard integration on X11 (preferred)'
    'xsel: clipboard integration on X11 (alternative)'
)
provides=('kvn' 'kvn-tui')
conflicts=('kvn' 'kvn-tui')
options=('!debug' '!strip')
source=("https://github.com/yarikov/kvn/releases/download/v0.38.1/kvn-0.38.1-x86_64-linux.tar.gz")
sha256sums=('3c29549f272bdc6bf090736e27798abffc71b6b9fec14d9e8487322260ce069f')

package() {
    cd "kvn-0.38.1-x86_64-linux"
    install -Dm755 kvn "$pkgdir/usr/bin/kvn"
    ln -s kvn "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 kvn-tui-sing-box-capabilities.hook \
        "$pkgdir/usr/share/libalpm/hooks/kvn-tui-sing-box-capabilities.hook"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
