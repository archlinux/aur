# Maintainer: Your Name <your.email@example.com>
pkgname=reddcoin-bin
pkgver=4.22.8
pkgrel=1
pkgdesc="Reddcoin - The Original Social Cryptocurrency (Binary Version)"
arch=('x86_64')
url="https://www.reddcoin.com/"
license=('MIT')
depends=('qt5-base' 'boost-libs' 'miniupnpc' 'libevent' 'openssl')
provides=('reddcoin')
conflicts=('reddcoin')

source=(
    "reddcoin-${pkgver}-x86_64-linux-gnu.tar.gz::https://download.reddcoin.com/bin/reddcoin-core-4.22.8/x86_64-linux-gnu/reddcoin-1d0e612e3f0c-x86_64-linux-gnu.tar.gz"
    "reddcoin-icon.svg"
)
sha256sums=(
    '5fa7907a1cc9564c7b5c1240a4495c49265aac37dd0fcfa8fd20a600bb17cf09'
    '9f1128822e93b1c9815e07fee9bb0db9adc4200c4f6bed0e8ba35a0a512300b0'
)

package() {
    cd "$srcdir/reddcoin-1d0e612e3f0c"

    # Create necessary directories
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    # Move binaries
    install -m755 bin/* "$pkgdir/usr/bin/"

    # Move libraries
    cp -r lib/* "$pkgdir/usr/lib/"

    # Move man pages
    cp -r share/man/man1/* "$pkgdir/usr/share/man/man1/"

    # Install license
    install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install desktop entry with icon
    echo "[Desktop Entry]
Type=Application
Name=Reddcoin
Comment=Reddcoin Cryptocurrency Wallet
Exec=reddcoin-qt
Icon=reddcoin
Categories=Office;Finance;
Keywords=Cryptocurrency;" > "$pkgdir/usr/share/applications/reddcoin.desktop"

    # Install icon
    install -Dm644 "$srcdir/reddcoin-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/reddcoin.svg"

    # Update icon cache (optional but recommended for some desktop environments)
    echo 'You might need to update your icon cache after installation.'
    echo 'For example, for GTK icons: gtk-update-icon-cache -f -t /usr/share/icons/hicolor'
}
