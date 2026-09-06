# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'libcap' 'sing-box')
optdepends=(
    'wl-clipboard: clipboard integration on Wayland'
    'xclip: clipboard integration on X11 (preferred)'
    'xsel: clipboard integration on X11 (alternative)'
)
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.29.0/kvn-tui-0.29.0-x86_64-linux.tar.gz")
sha256sums=('9e89b10745acf18ccd8bf71e77d2342524b6749965a1c8543fa39fe568a60f7a')

package() {
    cd "kvn-tui-0.29.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    ln -s kvn-tui "$pkgdir/usr/bin/kvn"
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 kvn-tui-sing-box-capabilities.hook \
        "$pkgdir/usr/share/libalpm/hooks/kvn-tui-sing-box-capabilities.hook"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
