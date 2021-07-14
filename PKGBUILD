# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

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
sha1sums=('0474a514b9c650ea1b09c2dc7e424988d9a2c188')
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
