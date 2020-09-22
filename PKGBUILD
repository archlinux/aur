# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sam S. <smls75@gmail.com>

pkgname=arx-fatalis-data-copy
pkgver=1.21
pkgrel=2
pkgdesc='Arx Fatalis game data from existing win32 installation (for use with arx-libertatis)'
url='https://arx-libertatis.org/'
arch=('i686' 'x86_64')
license=('custom:commercial')
provides=('arx-fatalis-data')
conflicts=('arx-fatalis-data-gog' 'arx-fatalis-data-demo')
depends=('inkscape')
optdepends=('arx-libertatis: native Linux game executable')
source=("https://raw.githubusercontent.com/arx/ArxLibertatis/master/scripts/arx-install-data")
sha512sums=('c3b8c2571d204f6a99b053aea3fc6b1db05d89429a40d45bad173b72fa303f64b85d73ef1730f4d229138fb0c9b75c85203c4bebc4b145ec847e9de83a82cbaf')
_gamefolder="Arx Fatalis"

package() {
    _realfolder="$(realpath "$startdir/$_gamefolder")"
    
    if [[ ! -e $_realfolder ]]; then
       error "Existing game installation folder not found"
       echo "    Please symlink it to '$startdir/$_gamefolder'"
       exit 1
    fi
    
    chmod +x arx-install-data
    ./arx-install-data --batch "$_realfolder" "$pkgdir/usr/share/arx"
}
