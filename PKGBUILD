# Maintainer: Molyuu <zhangjtroger@gmail.com>
pkgname=ttf-sarasa-gothic-sc
pkgver=0.38.0
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

sha256sums=('0545bc6752c509632fbf957a5afcc099790b49f1ef888ec0d094ce8d18fc32cd'
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