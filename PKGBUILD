# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.38.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation (transitional, replaced by kvn-bin)"
arch=('x86_64')
url="https://github.com/yarikov/kvn"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'libcap' 'sing-box')
optdepends=(
    'xdg-utils: open the project support page from the TUI'
    'wl-clipboard: clipboard integration on Wayland'
    'xclip: clipboard integration on X11 (preferred)'
    'xsel: clipboard integration on X11 (alternative)'
)
provides=('kvn' 'kvn-tui')
conflicts=('kvn' 'kvn-tui')
options=('!debug' '!strip')
source=("https://github.com/yarikov/kvn/releases/download/v0.38.0/kvn-tui-0.38.0-x86_64-linux.tar.gz")
sha256sums=('e7f35a37c48d6fef869242e58618b7d768ef4bfe786adaf712b89a754ed8d835')

package() {
    cd "kvn-0.38.0-x86_64-linux"
    install -Dm755 kvn "$pkgdir/usr/bin/kvn"
    ln -s kvn "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 kvn-tui-sing-box-capabilities.hook \
        "$pkgdir/usr/share/libalpm/hooks/kvn-tui-sing-box-capabilities.hook"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
