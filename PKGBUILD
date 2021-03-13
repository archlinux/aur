# Maintainer: Alessandro Marchioro <marciozgaming@gmail.com>
pkgname=apple-fonts
pkgver=1.0
pkgrel=1
pkgdesc="Apple San Francisco, New York fonts, directly from Apple official source"
arch=(x86_64)
url="https://developer.apple.com/fonts/"
depends=()
makedepends=(curl p7zip)
optdepends=()
provides=()

package() {
    mkdir $pkgdir/fontfiles/

    curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Font-Pro.dmg
    7z x SF-Font-Pro.dmg
    cd SanFranciscoPro
    7z x 'San Francisco Pro.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Font-Compact.dmg
    7z x SF-Font-Compact.dmg
    cd SanFranciscoCompact
    7z x 'San Francisco Compact.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    curl -O https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg
    7z x SF-Mono.dmg
    cd SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    curl -O https://devimages-cdn.apple.com/design/resources/download/NY-Font.dmg
    7z x NY-Font.dmg
    cd NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $pkgdir/fontfiles
    cd ..

    rm -r *.dmg NYFonts SanFranciscoCompact SanFranciscoPro SFMonoFonts

    mkdir -p $pkgdir/usr/share/fonts/OTF $pkgdir/usr/share/fonts/TTF
    mv $pkgdir/fontfiles/*.otf $pkgdir/usr/share/fonts/OTF
    mv $pkgdir/fontfiles/*.ttf $pkgdir/usr/share/fonts/TTF
    rm -rf $pkgdir/fontfiles
}
