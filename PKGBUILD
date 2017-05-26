# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=gog-torment-tides-of-numenera
_pkgname=torment-tides-of-numenera
pkgver=2.2.0.3
pkgrel=1
pkgdesc="An RPG and the spiritual successor to Planescape: Torment"
arch=('i686' 'x86_64')
url="https://torment.inxile-entertainment.com"
license=('custom')
depends=("sdl2")
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://gog_torment_tides_of_numenera_$pkgver.sh"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('1f7e151da30b1fb826bb76910836046946350b51df795fb30c0438ced49c5f3d'
            'daa3eef865d94af6ce116ff176074feae94c5b84fba0b60ec17186bd57dd3758'
            '72b4a6024869b2e83a1a9371b1219d9f54ffaaf7f9a097c784cfc351ed64333e')
PKGEXT=".pkg.tar"


package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r data/noarch/* "$pkgdir/opt/$pkgname"
  # Remove packaged libraries that result in the game not starting
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
