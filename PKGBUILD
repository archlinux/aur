# Maintainer: Ayatale <ayatale@qq.com>

pkgname=ttf-sarasa-ui-sc
pkgver=0.35.8
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
sha256sums=("f3d9aa5731bdcfe01d70800584e9028df6be6ecb4b29aedf8b249310d58e6594"
            "5e24aa89c520df12115f37591daf3affe87737da068227f1648ea01d70d70147")
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
