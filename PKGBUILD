# Maintainer: Ayatale <ayatale@qq.com>

pkgname=ttf-sarasa-ui-sc
pkgver=1.0.27
pkgrel=1
pkgdesc="A CJK programming font based on Iosevka and Source Han Sans. (123M/248M, only Sarasa UI SC inside)"
arch=("any")
url="https://github.com/be5invis/Sarasa-Gothic"
license=("OFL")
makedepends=("7zip")
provides=("ttf-sarasa-ui-sc")
conflicts=("ttf-sarasa-gothic")
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/SarasaGothic-TTF-$pkgver.7z"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/be5invis/Sarasa-Gothic/v${pkgver}/LICENSE")
sha256sums=('ebf55398745626ce3f2aebb2c84718857dfcb3b0dc0eb2c6f11044e289c80806'
            '32c932e0dbae4f6e6386964bbc2d04178707665a05ca65cf636241af13d50a53')
noextract=("SarasaGothic-TTF-$pkgver.7z")

prepare() {
    if [ -d "sarasa-*" ]; then
        rm -rf "sarasa-*"
    fi
    mkdir -p "sarasa-$pkgver"
    cd "sarasa-$pkgver"
    7z x "$srcdir/SarasaGothic-TTF-$pkgver.7z" "SarasaGothicSC*.ttf"
}

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 $srcdir/sarasa-$pkgver/*.ttf "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
