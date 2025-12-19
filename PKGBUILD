pkgname=tonkeeper-wallet-bin
pkgver=5.2.7
pkgrel=1
pkgdesc="Tonkeeper is the easiest self-custody wallet to pay toncoin and other tokens"
arch=('x86_64')
url="https://tonkeeper.com"
license=('MIT')

depends=('hicolor-icon-theme' 'fuse3')
optdepends=(
    'fuse2: direct AppImage execution'
    'fuse3: direct AppImage execution'
)

options=(!strip)
source=("https://github.com/DevelPhantom/wallet/releases/download/ton/Tonkeeper.Wallet-5.2.6.tar.gz")


sha256sums=('c90b325695b509dc416f85064e4a9da829b13abcac6455403eb5fd150492aef0')

install="${pkgname}.install"

prepare() {
    cd "$srcdir/Tonkeeper Wallet-5.2.6"
    chmod +x "Tonkeeper Wallet.AppImage"
}

package() {
    cd "$srcdir/Tonkeeper Wallet-5.2.6"
    
    install -Dm755 "Tonkeeper Wallet.AppImage" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"
    
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname}" <<EOF
#!/bin/bash
APPIMAGE="/opt/${pkgname}/${pkgname}.AppImage"
exec "\$APPIMAGE" --appimage-extract-and-run "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "Tonkeeper Wallet.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "Tonkeeper Wallet.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "Tonkeeper Wallet.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
