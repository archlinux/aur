# Maintainer: Herbert Knapp <herbert.knapp vivaldi.net>
pkgname="true-combat-elite-bin"
pkgver=0.49b
pkgrel=3
pkgdesc="Tactical 3D multiplayer 1st person shooter in the style of Counter Strike, Urban Terror based on Enemy Territory id3 engine."
arch=('i686' 'x86_64')
url="http://www.truecombatelite.com/"
license=('unknown')
options=(!strip)
source=('true-combat-elite-0.49b-linux.tar.xz::https://web.archive.org/web/20230927175150if_/https://pomf2.lain.la/f/m3epnqj6.tar.xz')
sha256sums=('74d71667082ea08b49a61551611dccab4a161b80dae3cf0dd5a7802e7e10d254')
depends=('lib32-libstdc++5' 'lib32-sdl12-compat')
prepare() {
  tar xvf true-combat-elite-0.49b-linux.tar.xz
}
package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/games"
  mv "${srcdir}/true-combat-elite/true-combat-elite" "${srcdir}/true-combat-elite/true-combat-elite-server" "${pkgdir}/usr/bin/"
  mv "${srcdir}/true-combat-elite" "${pkgdir}/usr/share/games/"
  
  _desktop="${pkgdir}/usr/share/applications/true-combat-elite.desktop"
  echo '[Desktop Entry]' > ${_desktop}
  echo 'Type=Application' >> ${_desktop}
  echo "Name=True Combat Elite ${pkgver/\.*/}" >> ${_desktop}
  echo "Comment=${pkgdesc}" >> ${_desktop}
  echo 'Exec=true-combat-elite' >> ${_desktop}
  echo "Icon=/usr/share/games/true-combat-elite/icon.png" >> ${_desktop}
  echo 'Terminal=false' >> ${_desktop}
  echo 'Categories=Games;ActionGame;' >> ${_desktop}
  echo 'First time users: start true-combat-elite three times to get native display resolution.'

  ## Fix launcher
  sed -i 's/@/\$\{@\}/' "${pkgdir}/usr/bin/true-combat-elite"
}

