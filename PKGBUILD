# Maintainer: Gennadiy Chernyshyk <genaloner@gmail.com>
# PKGBUILD source: https://github.com/TES3MP/openmw-tes3mp
# Special thanks to Grim Kriegor who provide tarball and make special script for easy build TES3MP: https://github.com/GrimKriegor/TES3MP-deploy/tree/development   

pkgname=openmw-tes3mp
pkgver=0.6.1
pkgrel=2
pkgdesc="TES3MP is a project aiming to add multiplayer functionality to OpenMW, a free and open source recreation of the popular Bethesda Softworks game \"The Elder Scrolls III: Morrowind\"."
arch=('x86_64')
url="https://github.com/TES3MP/openmw-tes3mp"
license=('GPL3' 'custom')
depends=('openal' 'openscenegraph' 'mygui>=3.2.1' 'bullet' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'ncurses5-compat-libs')
optdepends=('openmw: make engine configuration files')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('https://github.com/TES3MP/openmw-tes3mp/releases/download/tes3mp-0.6.1/tes3mp-GNU.Linux-x86_64-release-0.6.1-f532ab241d-p7.tar.gz'
        'https://raw.githubusercontent.com/TES3MP/openmw-tes3mp/master/files/tes3mp/tes3mp_logo.png'
        'tes3mp-client.desktop'
        'tes3mp-server.desktop'
        'tes3mp-browser.desktop')
sha256sums=('6f921660d75a56751987e97b55d1abc510a87338a55e37bbafa72d81cda1522b'
          '861e5e8cc7ddec2dbfb842d68cdd45e7cc564079b9cb37ad113ff140bf424fd9'
          '0e855bcaf8986059cc722cafbc3b0b08f270862f28e09201a3564886404407ed'
          '2bd9e9dddda956c7cbdc8bdf2448d42500aa88ffb7fb01d2cbffc58c22fdf57d'
          'ddccf2f35e41c2cbb35816f3bbfc53a9dd5809cd2830e8e324f45550852f6408')

prepare() {
  cd ${srcdir}/TES3MP

  # Remove all .git files
  find . -name "*git*" -exec rm -rf {} +

  # Remove all *.a files from lib
  rm -f lib/*.a

  # Remove junk files
  rm PluginExamples/README.md
  rm PluginExamples/LICENSE
  rm tes3mp-package-info.txt

  # Remove OpenMW junk files
  rm bsatool*
  rm esmtool*
  rm openmw*

  # Rename config files to .example for launcher script
  mv tes3mp-server-default.cfg tes3mp-server-default.cfg.example
  mv tes3mp-client-default.cfg tes3mp-client-default.cfg.example
}

package() {
  # Install .desktop files
  install -Dm644 tes3mp-client.desktop $pkgdir/usr/share/applications/tes3mp-client.desktop
  install -Dm644 tes3mp-server.desktop $pkgdir/usr/share/applications/tes3mp-server.desktop
  install -Dm644 tes3mp-browser.desktop $pkgdir/usr/share/applications/tes3mp-browser.desktop


  # Icon for .desktop files
  install -Dm644 tes3mp_logo.png $pkgdir/usr/share/pixmaps/tes3mp.png

  # Main
  cd ${srcdir}
  install -d $pkgdir/opt
  mv TES3MP $pkgdir/opt/$pkgname
}

# vim:set ts=2 sw=2 et:
