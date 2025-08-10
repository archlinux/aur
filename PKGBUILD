# Maintainer: Anmol <ani@chu.com>
pkgname=nalla-iptv-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="IPTV Player for M3U playlists with DRM support"
arch=('x86_64')
url="https://github.com/Anmol1184/Nalla-IPTV"
provides=('nalla-iptv-bin')
conflicts=('nalla-iptv-bin')

source=("https://github.com/Anmol1184/Nalla-IPTV/releases/download/v$pkgver/nalla-iptv-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    # Extract tar.gz
    tar -xzf "$srcdir/$pkgname-$pkgver.tar.gz" -C "$srcdir"

    # Assuming electron-builder's output is linux-unpacked/
    install -d "$pkgdir/usr/lib/nalla-iptv"
    cp -r "$srcdir/linux-unpacked/"* "$pkgdir/usr/lib/nalla-iptv/"

    # Launcher
    install -d "$pkgdir/usr/bin"
    echo "#!/bin/sh
exec electron /usr/lib/nalla-iptv/resources/app.asar \"\$@\"" > "$pkgdir/usr/bin/nalla-iptv"
    chmod +x "$pkgdir/usr/bin/nalla-iptv"

    # Desktop entry
    install -Dm644 "$srcdir/nalla-iptv.desktop" \
        "$pkgdir/usr/share/applications/nalla-iptv.desktop"

    # Icon
    install -Dm644 "$srcdir/icon.png" \
        "$pkgdir/usr/share/pixmaps/nalla-iptv.png"
}
