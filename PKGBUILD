# Maintainer: Ayatale <ayatale@qq.com>

pkgname=ttf-sarasa-ui-sc
pkgver=0.40.0
pkgrel=1
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (123M/248M, only Sarasa UI SC inside)"
arch=("any")
url="https://github.com/be5invis/Sarasa-Gothic"
license=("OFL")
makedepends=("p7zip")
provides=("ttf-sarasa-ui-sc")
conflicts=("ttf-sarasa-gothic")
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/sarasa-gothic-ttf-$pkgver.7z"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE")
sha256sums=('29d34d4e8ccd25e5a639f8eb4d8b8ecdc86d63b69fea8cee4ea15fb1a1b175e0'
            '9caccb70771a676613a8a9a9863f20c49c861383af99c1dd7cc354226b375832')
noextract=("sarasa-gothic-ttf-$pkgver.7z")

prepare() {
    if [ -d "sarasa-*" ]; then
        rm -rf "sarasa-*"
    fi
    mkdir "sarasa-$pkgver"
    cd "sarasa-$pkgver"
    7z x "$srcdir/sarasa-gothic-ttf-$pkgver.7z" "sarasa-ui-sc*.ttf"
}

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 $srcdir/sarasa-$pkgver/*.ttf "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
