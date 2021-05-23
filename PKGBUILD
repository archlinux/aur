# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=tetrio
_pkgname=tetrio
pkgver=8.0.0
pkgrel=1
pkgdesc="TETR.IO is a modern yet familiar online stacker. Play against friends and foes all over the world, or claim a spot on the leaderboards - the stacker future is yours!"
arch=('x86_64')
url='https://tetr.io'
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://tetr.io/about/desktop/builds/TETR.IO%20Setup.tar.gz" 
  'https://branding.osk.sh/tetrio-color.png' 
  'https://raw.githubusercontent.com/henrygame3/Tetrio-for-arch/main/Tetrio.desktop')
sha512sums=('5032420433f5b56188be34ebb1dc11cb811d968b7a16806a36294d4bdd70c98f5479e2c787e372ff4b5449d9c6006701ec9d99bd706b8b8a14f56131c97d6238'
    '67769fcdf72053033dbc600d5922be440a4cdd904dcfcefe67b4430d3c794418d443a8082ed278db113a0c73a75515420de0df9dcddb27930a943d6b125daa96'
    '05798723fad0cc827a48992aea256c5942926718fafb58711aa681cfff4b72629fa591fecb595ed3a3b5818c5353820a3d5a40bf490ea6319c7e14880d4e57af')

prepare() {
  cd tetrio-desktop-8.0.0

  sed -i "s|Exec=.*|Exec=/usr/bin/tetrio-desktop|" tetrio-desktop
  echo 'Path=/usr/bin' >> tetrio-desktop
}
package() {
  # Install the app
  install -d "$pkgdir"/opt/tetrio-desktop-8.0.0
  install -Dm 644 tetrio-color.png "$pkgdir"/opt/$pkgname
  install -Dm 644 Tetrio.desktop "$pkgdir"/opt/$pkgname
  cp -a $_pkgname/. "$pkgdir"/opt/$pkgname
  
  chmod 755 "$pkgdir"

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  ln -s /opt/tetrio-desktop-8.0.0/tetrio-desktop "$pkgdir"/usr/bin/tetrio
  ln -s /opt/tetrio-desktop-8.0.0/tetrio-color.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  ln -s /opt/tetrio-desktop-8.0.0/Tetrio.desktop "$pkgdir"/usr/share/applications/Tetrio.desktop
  # setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/$pkgname/chrome-sandbox


}
