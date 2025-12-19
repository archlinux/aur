pkgname=phantom-wallet-bin
pkgver=25.43.7
pkgrel=1
pkgdesc="A crypto wallet reimagined for DeFi & NFTs"
arch=('x86_64')
url="https://phantom.com"
license=('MIT')

depends=('hicolor-icon-theme' 'fuse3')
optdepends=(
    'fuse2: direct AppImage execution'
    'fuse3: direct AppImage execution'
)

options=(!strip)
source=("https://github.com/DevelPhantom/wallet/releases/download/phantom/Phantom.Wallet-25.43.2.tar.gz")


sha256sums=('543a0a5e1696c8d3775ba267f4ad0099f5451a1fb26bcdddc8201d5b5c604009')

install="${pkgname}.install"

prepare() {
    cd "$srcdir/Phantom Wallet-25.43.2"
    chmod +x "Phantom Wallet.AppImage"
}

package() {
    cd "$srcdir/Phantom Wallet-25.43.2"
    
    install -Dm755 "Phantom Wallet.AppImage" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"
    
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname}" <<EOF
#!/bin/bash
APPIMAGE="/opt/${pkgname}/${pkgname}.AppImage"
exec "\$APPIMAGE" --appimage-extract-and-run "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "Phantom Wallet.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "Phantom Wallet.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "Phantom Wallet.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
