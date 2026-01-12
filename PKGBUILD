# Maintainer: Your Name <your.email@example.com>
pkgname=reddcoin-bin
pkgver=4.22.9
pkgrel=1
pkgdesc="Reddcoin - The Original Social Cryptocurrency (Binary Version)"
arch=('x86_64')
url="https://www.reddcoin.com/"
license=('MIT')
depends=('qt5-base' 'boost-libs' 'miniupnpc' 'libevent' 'openssl')
provides=('reddcoin')
conflicts=('reddcoin')

source=(
    "reddcoin-${pkgver}.tar.gz::https://download.reddcoin.com/bin/reddcoin-core-${pkgver}/reddcoin-${pkgver}-x86_64-linux-gnu.tar.gz"
    "reddcoin-icon.svg"
)
sha256sums=('0e830292cd52e7cb4fb32b07d72d7d590e60c3ebaceeb9b85cde97d27e707fb6'
            '9f1128822e93b1c9815e07fee9bb0db9adc4200c4f6bed0e8ba35a0a512300b0')

package() {
    cd "$srcdir/reddcoin-${pkgver}"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    install -m755 bin/* "$pkgdir/usr/bin/"
    cp -r lib/* "$pkgdir/usr/lib/"
    cp -r share/man/man1/* "$pkgdir/usr/share/man/man1/"
    install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    echo "[Desktop Entry]
Type=Application
Name=Reddcoin
Comment=Reddcoin Cryptocurrency Wallet
Exec=reddcoin-qt
Icon=reddcoin
Categories=Office;Finance;
Keywords=Cryptocurrency;" >"$pkgdir/usr/share/applications/reddcoin.desktop"

    install -Dm644 "$srcdir/reddcoin-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/reddcoin.svg"
}
