# Maintainer: peachoff <peshoff@proton.me>
pkgname=zapret-hub
pkgver=2.1.3b
pkgrel=1
pkgdesc="Desktop hub for managing network bypass utilities (zapret, tg-ws-proxy, vpn)"
arch=('x86_64')
url="https://github.com/peachoff/Zapret-Hub-Linux"
license=('MIT')
options=('!strip')
depends=('glib2' 'libglvnd' 'fuse2')
source=("$url/releases/download/v2.1.3b/zapret-hub-${pkgver}-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
    local dir="zapret-hub-${pkgver}-linux-x64"

    install -dm755 "$pkgdir/opt/zapret-hub"
    cp -a "$srcdir/$dir"/* "$pkgdir/opt/zapret-hub/"

    install -Dm644 "$srcdir/$dir/pkg/zapret-hub.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/zapret-hub.png"

    install -Dm644 "$srcdir/$dir/pkg/zapret-hub.desktop" \
        "$pkgdir/usr/share/applications/zapret-hub.desktop"

    install -Dm644 "$srcdir/$dir/pkg/zapret-hub.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/zapret-hub.metainfo.xml" 2>/dev/null || true

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /opt/zapret-hub/zapret-hub "$@"\n' \
        > "$pkgdir/usr/bin/zapret-hub"
    chmod 755 "$pkgdir/usr/bin/zapret-hub"
}
