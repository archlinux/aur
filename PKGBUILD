# Maintainer: Aaron Mueller <mail@aaron-mueller.de>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=nikki
pkgver=1.0
pkgrel=5
pkgdesc="Nikki and the robots. A game where you try to cross those evil plans on behalf of a secret organization."
arch=("i686" "x86_64")
url="http://abandon"
license=("LGPL" "CCPL")
depends=("libsndfile" "openal" "qt4")
source=("http://dl.gamux.org/game/download/games/i386/clientgame/nikki/$pkgname.tar.gz")
sha256sums=("387bfa1d5e602686539eb2371d9d1bdeea13f263f631b26f0af8061e8daab4bb")

if [ "$CARCH" == "x86_64" ]; then
  source=("http://dl.gamux.org/game/download/games/i386/clientgame/nikki/$pkgname-64.tar.gz")
  sha256sums=("6d642c03959afc4bcd6d846c61d80eae27d58dded5a957858d18ca7d7d5c9df7")
fi

options=("!strip")

package() {
  cd nikki

  # folders
  install -d "$pkgdir"/{opt/nikki,usr/bin}

  # binaries + launcher
  install -m755 {core,nikki.sh,restarter} "$pkgdir"/opt/nikki
  ln -s /opt/nikki/nikki.sh "$pkgdir"/usr/bin/nikki

  # old libs that would be AUR deps otherwise
  install -m644 libzip.so.1 "$pkgdir"/opt/nikki

  # data
  cp -r data "$pkgdir"/opt/nikki

  # doc + license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/nikki/LICENSE
  install -m644 LICENSES/*.txt "$pkgdir"/usr/share/licenses/nikki
  install -Dm644 README "$pkgdir"/usr/share/doc/nikki/README
  install -m644 THANKS "$pkgdir"/usr/share/doc/nikki
  ln -s /opt/nikki/data/manual "$pkgdir"/usr/share/doc/nikki/

  # .desktop entry
  install -Dm644 data/svg/nikki-icon.svg "$pkgdir"/usr/share/pixmaps/nikki.svg
  install -Dm644 data/menu/nikki.desktop "$pkgdir"/usr/share/applications/nikki.desktop
}
