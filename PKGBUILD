# Maintainer: Molyuu <mi@molyuu.cyou>
pkgname=ttf-sarasa-gothic-sc
pkgver=0.41.7
pkgrel=1
url=https://github.com/be5invis/Sarasa-Gothic
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (only Sarasa Gothic SC inside)"
arch=(any)
depends=()
license=("OFL")
makedepends=("p7zip")
provides=("ttf-sarasa-gothic-sc")
conflicts=("ttf-sarasa-gothic")
source=(
    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/sarasa-gothic-ttf-$pkgver.7z"
    "LICENSE"
)

sha256sums=('374056f4c5edabb889ed060281c143f641af98addf7d03037ebfc62bd7c73b2b'
            '9caccb70771a676613a8a9a9863f20c49c861383af99c1dd7cc354226b375832')

noextract=("sarasa-gothic-ttf-$pkgver.7z")

prepare() {
    if [ -d "sarasa-*" ]; then
        rm -rf "sarasa-*"
    fi
    mkdir "sarasa-$pkgver"
    cd "sarasa-$pkgver"
    7z x "$srcdir/sarasa-gothic-ttf-$pkgver.7z" "sarasa-gothic-sc*.ttf"
}

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 $srcdir/sarasa-$pkgver/*.ttf "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
