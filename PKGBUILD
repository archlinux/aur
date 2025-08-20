# Maintainer: Anmol <ani@chu.com>
pkgname=nalla-iptv-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="IPTV Player for M3U playlists with DRM support"
arch=('x86_64')
url="https://github.com/Anmol1184/NallaIPTV"
license=('custom')
provides=('nalla-iptv')
conflicts=('nalla-iptv')
options=(!strip) 

source=(
  "https://github.com/Anmol1184/NallaIPTV/releases/download/v${pkgver}/nalla-iptv-bin-${pkgver}.tar.gz"
)
sha256sums=('SKIP')

package() {
    install -d "$pkgdir/usr/lib/nalla-iptv"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/pixmaps"

    tar -xzf "$srcdir/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/usr/lib/nalla-iptv"

    echo "#!/bin/sh
exec /usr/lib/nalla-iptv/nalla-iptv \"\$@\"" > "$pkgdir/usr/bin/nalla-iptv"
    chmod +x "$pkgdir/usr/bin/nalla-iptv"

    install -Dm644 "$pkgdir/usr/lib/nalla-iptv/nalla-iptv.desktop" \
        "$pkgdir/usr/share/applications/nalla-iptv.desktop"
    install -Dm644 "$pkgdir/usr/lib/nalla-iptv/icon.png" \
        "$pkgdir/usr/share/pixmaps/nalla-iptv.png"
}
