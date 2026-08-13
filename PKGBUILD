# Maintainer: RDMillen <ross@kova.md>
pkgname=kova-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="Markdown presentation authoring tool (pre-built binary)"
arch=('x86_64')
url="https://github.com/KovaMD/Kova"
license=('GPL-3.0-only')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
)
provides=('kova')
conflicts=('kova')
# Same key that signs the deb/rpm repos (deb.kova.md/key.gpg, rpm.kova.md/key.gpg).
validpgpkeys=('F5FE856033771D0CBCFB6CE7F0360B67BD16F99A')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/Kova_${pkgver}_x86_64.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::$url/releases/download/v$pkgver/Kova_${pkgver}_x86_64.tar.gz.sig")
sha256sums=('57a201da36c7422432930e3359eb4ba6d9dddeaf1b3b62a4d15c1d3968764afc'
            'SKIP')

package() {
    cd "kova"

    install -Dm755 "kova" "$pkgdir/usr/bin/kova"
    install -Dm644 "kova.desktop" "$pkgdir/usr/share/applications/kova.desktop"

    for size in 32x32 64x64 128x128; do
        install -Dm644 "icons/$size.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/kova.png"
    done
    install -Dm644 "icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/kova.png"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
