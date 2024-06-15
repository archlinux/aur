# Maintainer: Varakh <varakh@varakh.de>

pkgname=altair-ai-studio
pkgver=2024.0.1
pkgrel=1
_enginever=10.4.1
pkgdesc="Data science tool anyone can use to design and prototype highly explainable AI and machine learning models that help build trust throughout your organization"
arch=('any')
url="https://altair.com/altair-ai-studio"
depends=('java-runtime=11' 'java-environment=11')
makedepends=('unzip' 'gendesk')
source=(https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio.zip \
        altair-ai-studio.sh)
sha256sums=('a97591b336ad33a312a6aa2fef128e08d734ab5de4d3fa944e21947f99a40c07'
            '34c4e6c99b5c0ed76511edfc98eb3b8aa3c0c40fbe1ff724d3092d484b7ee82a')

prepare() {
    gendesk -f -n \
                --name "Altair AI Studio" \
                --pkgname "$pkgname" \
                --pkgdesc "$pkgdesc" \
                --categories="Science;Development"
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt/$pkgname"
    unzip -p "$srcdir/Altair/RapidMiner/AI Studio $pkgver/lib/rapidminer-studio-core-$_enginever.jar" \
             com/rapidminer/resources/rapidminer_frame_icon_128.png > "$pkgname.png"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    cp -R "$srcdir/Altair/RapidMiner/AI Studio $pkgver/." "$pkgdir/opt/$pkgname/"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/applications/"

    install -Dm655 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
