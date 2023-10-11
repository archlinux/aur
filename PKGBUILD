# Maintainer: Aaron Liu <aaronliu zero 13 zero at gmail .com>
pkgname=otf-san-francisco-new-york
pkgver=1.0.0
pkgrel=1
pkgdesc="Apple's San Francisco fonts, including New York but not script extensions, from official sources with licenses"
arch=(any)
url='https://developer.apple.com/fonts/'
license=(custom)
conflicts=(apple-fonts otf-san-francisco otf-san-francisco-mono otf-apple-sf-compact otf-apple-sf-mono otf-apple-ny otf-new-york)
provides=(ttf-font) # nobody bothered to provide any font-specific names... please comment if you find one
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/NY.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg'
        LICENSE-COMPACT LICENSE-MONO LICENSE-NY LICENSE-PRO)
sha256sums=('9e4b8781edff572f25c18c7dcfea6fb1065fceb3483f82b43aeb693e5e325e7d'
            'f90e0722724197714b6f6f7fc7dbad7fb039e6e879afbf5e87fee17500dd6d22'
            '5ce89673873b61a87e98cedac64f20d60635daf5da99017bf0a7aa777ff4fdc1'
            'a6a91880966db4a287a936286c1523b9dd1f5bbf5d4b9b5dcd8276df07bd4d6e'
            'a3c5661529d654e92e7310fc2572eae7f6a165db54be918e2bee35afb39159f1'
            '079512256688e048803fedeb087eaaf8a3109448f160c6f84c6561f4eb763296'
            '5579b2b33d529bd51efab1f378e5c600aafd8fe1481f3c28e5d914742c801ba2'
            '18273048eee4851c929531c954a5c36bbd897404e49c69309a3fc452973c3885')
makedepends=(p7zip) # For extracting dmg and pkg files

prepare() {
    cd "$srcdir"
    mkdir otf

    7z x SF-Pro.dmg
    7z x SF-Compact.dmg
    7z x NY.dmg
    7z x SF-Mono.dmg

    cd SFProFonts
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/*.otf "$srcdir/otf/"

    cd ../SFCompactFonts
    7z x 'SF Compact Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/*.otf "$srcdir/otf/"

    cd ../NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/*.otf "$srcdir/otf/"

    cd ../SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/*.otf "$srcdir/otf/"
}

package() {
    install -Dm644 "$srcdir/otf"/* -t "$pkgdir/usr/share/fonts/$pkgname"
    install -Dm644 LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname"
}
