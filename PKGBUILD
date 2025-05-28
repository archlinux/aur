# Maintainer: Fidel Ramos <archlinux.shklm@simplelogin.com>

pkgname=electrum-abc-bin
pkgdesc='Lightweight eCash wallet'
pkgver=5.4.2
pkgrel=1
url='https://bitcoinabc.org/electrum'
arch=('x86_64')
license=('MIT')
provides=('electrum-abc')
validpgpkeys=(D77BFAEDC2C0AD61D9D5DC32B838D022AFCF71C9 # Pierre K <pierrekn@gmail.com>
              )
_appimage="ElectrumABC-${pkgver}-${arch}.AppImage"
_pkgbin=electrum-abc
source_x86_64=("https://github.com/Bitcoin-ABC/ElectrumABC/releases/download/${pkgver}/${_appimage}")
sha256sums_x86_64=('89c972bc6d304d1b39ddc0d32aaa9bd0daac57345e87acfc0d135da55eaea8c6')

package() {
    # Extract files
    chmod +x "$srcdir/$_appimage"
    $srcdir/$_appimage --appimage-extract
    # Clean old build dir files
    rm -rf $srcdir/$_pkgbin
    mv -f "$srcdir/squashfs-root" "$srcdir/$_pkgbin"

    # Install Icon
    install -Dm644 "$srcdir/$_pkgbin/electrumABC.png" "$pkgdir/usr/share/pixmaps/electrumABC.png"

    install -d "$pkgdir/opt/$_pkgbin"
    cp -a "$srcdir/$_pkgbin/." "$pkgdir/opt/$_pkgbin/"
    chmod -R +rx "$pkgdir/opt/$_pkgbin"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgbin/AppRun" "$pkgdir/usr/bin/$_pkgbin"
    install -Dm644 "$srcdir/$_pkgbin/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
}
