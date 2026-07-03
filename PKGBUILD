# Maintainer: gensui-fuga <gensui-fuga@users.noreply.github.com>

pkgname=lanshare-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-Platform LAN File Sharing — frosted glass web UI, dual upload/download dirs, adaptive theme"
arch=('x86_64' 'aarch64')
url="https://github.com/gensui-fuga/lanshare"
license=('GPL3')
depends=('glibc')

build() {
    case "$CARCH" in
        x86_64) _arch="amd64" ;;
        aarch64) _arch="arm64" ;;
        *) error "Unsupported: $CARCH" ;;
    esac
    msg "Downloading lanshare-linux-$_arch v$pkgver..."
    curl -sSL -o lanshare \
        "https://github.com/gensui-fuga/lanshare/releases/download/v$pkgver/lanshare-linux-$_arch"
    chmod +x lanshare
}

package() {
    install -Dm755 "$srcdir/lanshare" "$pkgdir/usr/bin/lanshare"
    install -Dm644 "$srcdir/../../lanshare-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
