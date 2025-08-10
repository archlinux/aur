# Maintainer: Anmol <ani@chu.com>
pkgname=nalla-iptv-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="IPTV Player for M3U playlists with DRM support"
arch=('x86_64')
url="https://github.com/Anmol1184/Nalla-IPTV"
provides=('nalla-iptv-bin')
conflicts=('nalla-iptv-bin')

source=("https://github.com/Anmol1184/Nalla-IPTV/releases/download/v$pkgver/nalla-iptv-bin-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir"

    install -d "$pkgdir/usr/lib/nalla-iptv"
    cp -r "$srcdir/"* "$pkgdir/usr/lib/nalla-iptv/"

    install -d "$pkgdir/usr/bin"
   echo "#!/bin/sh
exec /usr/lib/nalla-iptv/nalla-iptv \"\$@\"" > "$pkgdir/usr/bin/nalla-iptv"

    chmod +x "$pkgdir/usr/bin/nalla-iptv"

    install -Dm644 "$srcdir/nalla-iptv.desktop" \
        "$pkgdir/usr/share/applications/nalla-iptv.desktop"

    install -Dm644 "$srcdir/icon.png" \
        "$pkgdir/usr/share/pixmaps/nalla-iptv.png"
}
