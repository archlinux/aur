# Maintainer:
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=nikki
pkgver=1.0
pkgrel=6
pkgdesc="Nikki and the Robots platformer game"
arch=('i686' 'x86_64')
url="https://github.com/nikki-and-the-robots"
license=('LGPL' 'CCPL')
depends=('libsndfile' 'openal' 'qt4')
optdepends=('nikki-levels-git: community levels')
options=('!strip')
source_i686=("https://github.com/nikki-and-the-robots/nikki/releases/download/$pkgver/nikki-$pkgver-marley-linux-i386.tar.gz")
source_x86_64=("https://github.com/nikki-and-the-robots/nikki/releases/download/$pkgver/nikki-$pkgver-marley-linux-x86_64.tar.gz")
sha256sums_i686=('387bfa1d5e602686539eb2371d9d1bdeea13f263f631b26f0af8061e8daab4bb')
sha256sums_x86_64=('6d642c03959afc4bcd6d846c61d80eae27d58dded5a957858d18ca7d7d5c9df7')

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
