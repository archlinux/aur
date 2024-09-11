# Maintainer: tippfehlr <tippfehlr at gmail dot com>

_pkgname=inav-blackbox-explorer
pkgname=inav-blackbox-explorer-bin
pkgver=7.0.1
pkgrel=1
pkgdesc="Interactive log viewer for flight logs recorded with blackbox"
arch=('x86_64')
url="https://github.com/iNavFlight/blackbox-log-viewer"
license=('GPL3')
provides=('inav-blackbox-explorer')
conflicts=('inav-blackbox-explorer')
source=(
    "https://github.com/iNavFlight/blackbox-log-viewer/releases/download/$pkgver/INAV-BlackboxExplorer_linux64-$pkgver-1.x86_64.rpm"
    "inav-blackbox-explorer.diff"
)
sha256sums=('856e46b95fc07665c2a4c2979e84ad159d7f049f2103bba09ae368057c5aa727'
    '71df70a14d134c16df2678401e814118960ea84e046e3e1cf3c908aee82ba67a')

prepare() {
    cd "$srcdir/opt/inav/inav-blackbox-explorer"
    sed -i 's/Name=.*/Name=INAV Blackbox Explorer/' inav-blackbox-explorer.desktop
    sed -i 's/Comment=.*/Comment=Crossplatform blackbox analytics tool for the INAV flight control system/' inav-blackbox-explorer.desktop
    sed -i 's|Exec=.*|Exec=/opt/inav-blackbox-explorer/inav-blackbox-explorer|' inav-blackbox-explorer.desktop
    sed -i 's/Icon=.*/Icon=inav-blackbox-explorer/' inav-blackbox-explorer.desktop
}

package() {
    cd "$srcdir/opt/inav/inav-blackbox-explorer"
    install -d "$pkgdir/opt/inav-blackbox-explorer"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

    cp -dpr --no-preserve=ownership . "$pkgdir/opt/inav-blackbox-explorer"
    chmod +x "$pkgdir/opt/inav-blackbox-explorer/inav-blackbox-explorer"
    chmod +x "$pkgdir/opt/inav-blackbox-explorer/chrome_crashpad_handler"

    ln -s "/opt/inav-blackbox-explorer/inav-blackbox-explorer.desktop" "$pkgdir/usr/share/applications/"
    ln -s "/opt/inav-blackbox-explorer/icon/inav_icon_128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/inav-blackbox-explorer.png"
    ln -s "/opt/inav-blackbox-explorer/inav-blackbox-explorer" "$pkgdir/usr/bin/"
}
