# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Maintainer: Rodrigo Fuentealba <dev-rfc83@protonmail.com>
# Maintainer: Varakh <varakh@varakh.de>

pkgname=rapidminer-studio
pkgver=10.1.2
pkgrel=1
pkgdesc="RapidMiner is the enterprise-ready data science platform"
arch=('any')
url="https://rapidminer.com/platform/"
license=('AGPL3')
depends=('java-runtime=11' 'java-environment=11')
makedepends=('unzip' 'gendesk')
source=(https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio.zip \
        rapidminer-studio.sh)
sha256sums=('102d87a26d1a2186c2ef5f45cd6a0585e8ec3356584fd31f2faa2773c4d06b3f'
            'd3d76353c1ae15eec44c2fc638bbde98a192b70447bd467763f6d41cf24b6e5a')

prepare() {
    gendesk -f -n \
                --name "RapidMiner Studio" \
                --pkgname "$pkgname" \
                --pkgdesc "$pkgdesc" \
                --categories="Science;Education;Development"
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt/$pkgname"
    unzip -p "$srcdir/$pkgname/lib/rapidminer-studio-core-$pkgver.jar" \
             com/rapidminer/resources/rapidminer_frame_icon_128.png > "$pkgname.png"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    cp -R "$srcdir/$pkgname/" "$pkgdir/opt/"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/applications/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm655 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
