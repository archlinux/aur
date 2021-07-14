# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=arx-fatalis-data-gog
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from GOG.com installer (for use with arx-libertatis)'
url='https://www.gog.com/game/arx_fatalis'
arch=('any')
license=('custom:commercial')
provides=('arxfatalis-data')
conflicts=('arxfatalis-data-copy' 'arxfatalis-data-demo'
           'arx-fatalis-data-copy' 'arx-fatalis-data-demo')
makedepends=('innoextract')
optdepends=('arxlibertatis:  native Linux game executable')
DLAGENTS+=('gog::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="setup_arx_fatalis_2.0.0.7.exe"

source=("gog://$_gamepkg"
        "https://raw.githubusercontent.com/arx/ArxLibertatis/master/scripts/arx-install-data")  # from http://arx.vg/arx-install-data
md5sums=('5be0898e71632e46ca430d7a32d0179a'
         '95d7cd918a414e020f937a6a31c8e1ae')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch "$_gamepkg" "$pkgdir/usr/share/arx"
}
