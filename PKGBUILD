# Maintainer: produnis <joe dot slam at produnis dot de>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=parajve
pkgver=0.7.0
pkgrel=2
pkgdesc="Advanced emulator for the GCE Vectrex game console(1982) with built-in game ROMS."
arch=('any')
url="http://www.vectrex.fr/ParaJVE/"
license=('custom')
depends=('java-runtime')
install=$pkgname.install
source=('https://dlf.emu-land.net/vert/ParaJVE_0.7.0_linux.tgz'
        'http://dl.openhandhelds.org/dingoo/screenshots/splash.png'
        LICENSE
        $pkgname
        $pkgname.desktop)
md5sums=('146dcf4bd42865d5fb930dde6a8d34f5'
         '3b44b85d75849edd67bc021e2e03317e'
         '7f135fe82df5edc0b1b9952851837b53'
         'e17a3dd4473b2b65ae257fbd045466bc'
         'a0536133a127435f8f715d5dd68da074')

package() {
  cd $srcdir/ParaJVE

  # Delete unneeded files
  if [ "${CARCH}" = 'x86_64' ]; then
     rm libs/setup/*32*
  elif  [ "${CARCH}" = 'i686' ]; then
     rm libs/setup/*64*
  fi

  # Data
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -r * $pkgdir/usr/share/$pkgname

  # Start file
  cd ..
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

  # License
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/ParaJVE/LICENSE

  # Desktop icon
  install -Dm644 splash.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Write permissions
  chmod 777 -R $pkgdir/usr/share/$pkgname
}
