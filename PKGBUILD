# Maintainer: David Hamill <bigbanana29@aol.com>

pkgbase=nothing-font-git
pkgname=(ttf-nothing-font-git otf-nothing-font-git)
pkgver=1.0
pkgrel=1
pkgdesc="Nothing typefaces (designed for NothingOS)"
arch=('any')
url='https://github.com/xeji01/nothingfont'
source=('git+https://github.com/xeji01/nothingfont')
sha512sums=('SKIP')

function _package {
    cd nothingfont/fonts

    case "$1" in
        ttf-nothing-font-git)
            pkgdesc="Nothing typefaces (designed for NothingOS)"
            fonts=(*.ttf)
            installdir=TTF;;
        otf-nothing-font-git)
            pkgdesc="Nothing typefaces (designed for NothingOS)"
            fonts=(*.otf)
            installdir=OTF;;
    esac

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/$installdir"

    # Install fonts
    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/$installdir"
    done
}

for _pkgname in ${pkgname[@]}; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done
