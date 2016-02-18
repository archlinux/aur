# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sauyon Lee <me@sauyon.com>

pkgname=powerline-fonts
_tag=2015-12-04
pkgver=20151204
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
url='https://github.com/powerline/fonts'
license=('CPL')
pkgdesc="Patched fonts for Powerline users"
arch=('any')
install="$pkgname.install"
source=("https://github.com/powerline/fonts/archive/${_tag}.zip"
        "$pkgname.install")
sha256sums=('b6673e0e28441cc04065f8e5c79960aeaa220dae52351852b37e6cf3a03bb8af'
            '7a6082125002b0be5b3e570b4d448af6ff018171d7d15eb519d7db815df00733')

install_files() {
    local pattern="$1"
    local dir="$2"

    find . -iname "$pattern" -exec install -m644 {} "$dir" \;
}

package() {
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -d "$pkgdir/usr/share/fonts/misc"
    install -d "$pkgdir/usr/share/kbd/consolefonts"

    cd "$srcdir/fonts-$_tag"
    install_files "*.ttf" "$pkgdir/usr/share/fonts/TTF/"
    install_files "*.otf" "$pkgdir/usr/share/fonts/OTF/"
    install_files "*.pcf.gz" "$pkgdir/usr/share/fonts/misc."
    install_files "*.psf.gz" "$pkgdir/usr/share/kbd/consolefonts/"
}
