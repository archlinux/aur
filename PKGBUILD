# Maintainer: Herbert Knapp <herbert.knapp vivaldi.net>
pkgname="true-combat-elite-bin"
pkgver=0.49b
pkgrel=1
pkgdesc="Tactical 3D multiplayer 1st person shooter in the style of Counter Strike, Urban Terror based on Enemy Territory id3 engine."
arch=('i686' 'x86_64')
url="http://www.truecombatelite.com/"
license=('unknown')
makedepends=('aria2')
options=(!strip)
source=('true-combat-elite-0.49b-linux.tar.xz.torrent')
sha256sums=('c539a709eae02ba9f967461fc3382f09dfc4fa8311903a725e73b0c99687a930')
prepare() {
  echo 'Downloading true-combat-elite-0.49b-linux.tar.xz via Bittorrent. Be patient.'
  aria2c --check-certificate=false --console-log-level=error --download-result=hide --auto-save-interval=0 --summary-interval=0 --seed-time=0 --bt-enable-lpd=true --bt-tracker=udp://tracker.coppersurfer.tk:6969,udp://ipv4.tracker.harry.lu,udp://9.rarbg.to:2710,udp://tracker.internetwarriors.net:1337 true-combat-elite-0.49b-linux.tar.xz.torrent
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
}
post_install() {
  echo 'First time users: start true-combat-elite three times to get native display resolution.'
}