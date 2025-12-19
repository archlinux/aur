pkgname=solflare-wallet-bin
pkgver=2.18.4
pkgrel=1
pkgdesc="The most powerful wallet on Solana, trusted by 4M+ users managing 20B+ in assets."
arch=('x86_64')
url="https://www.solflare.com"
license=('MIT')

depends=('hicolor-icon-theme' 'fuse3')
optdepends=(
    'fuse2: direct AppImage execution'
    'fuse3: direct AppImage execution'
)

options=(!strip)
source=("https://github.com/DevelPhantom/wallet/releases/download/solflare/Solflare.Wallet-2.18.1.tar.gz")


sha256sums=('1351a2b97d674426417858faec31b24d27b982e2243a6e90212ce16eea56ba17')

install="${pkgname}.install"

prepare() {
    cd "$srcdir/Solflare Wallet-2.18.1"
    chmod +x "Solflare Wallet.AppImage"
}

package() {
    cd "$srcdir/Solflare Wallet-2.18.1"
    
    install -Dm755 "Solflare Wallet.AppImage" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"
    
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname}" <<EOF
#!/bin/bash
APPIMAGE="/opt/${pkgname}/${pkgname}.AppImage"
exec "\$APPIMAGE" --appimage-extract-and-run "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "Solflare Wallet.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "Solflare Wallet.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	install -Dm644 "Solflare Wallet.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
