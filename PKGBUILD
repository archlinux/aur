# $Id$
# Maintainer: thiagoc <root@thiagoc.net>

pkgname=(ttf-adobe-source-code-pro otf-adobe-source-code-pro)
pkgver=1.017R
pkgrel=1
pkgdesc="A set of OpenType fonts that have been designed to work well in user interface (UI) environments."
arch=('any')
license=('custom:SIL')
url="http://adobe-fonts.github.io/source-code-pro"
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/adobe-fonts/source-code-pro/archive/${pkgver}.zip")
md5sums=('6f3499830ea1ffb4a7ade2d65fe2ddee')

function _package {
    cd "$srcdir/source-code-pro-$pkgver"

    case "$1" in
        ttf-adobe-source-code-pro)
            install=ttf.install
            cd TTF
            fonts=(SourceCodePro-*.ttf)
            installdir=TTF;;
        otf-adobe-source-code-pro)
            install=otf.install
            cd OTF
            fonts=(SourceCodePro-*.otf)
            installdir=OTF;;
    esac

    install -dm 755 "$pkgdir/usr/share/fonts/$installdir"

    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/$installdir"
    done

    install -D -m644 "$srcdir/source-code-pro-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

for _pkgname in ${pkgname[@]}; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done
