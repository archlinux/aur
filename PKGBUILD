# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arx-fatalis-data-gog
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from GOG.com installer'
url='http://www.gog.com/en/gamecard/arx_fatalis'
arch=('i686' 'x86_64')
license=('custom:commercial')
makedepends=('innoextract')
provides=('arx-fatalis-data')
conflicts=('arx-fatalis-data-copy' 'arx-fatalis-data-demo')
install='arx-fatalis-data.install'
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="setup_arx_fatalis_2.0.0.7.exe"

source=("gog://$_gamepkg"
        "arx-install-data")  # from http://arx.vg/arx-install-data
md5sums=('5be0898e71632e46ca430d7a32d0179a'
         'fc5456e4c213af243b65862db8d5db0a')

package() {
  cd $srcdir

  chmod +x arx-install-data
  ./arx-install-data --batch "$_gamepkg" "$pkgdir/usr/share/arx"

  mkdir "$pkgdir/usr/share/games" && ln -s "/usr/share/arx/" "$pkgdir/usr/share/games/arx" 
}
