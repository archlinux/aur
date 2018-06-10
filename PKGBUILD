# Maintainer: TheSupremist aka supremesonicbrazil <supreminho2 at gmail dot com>

pkgname=gbml-git
_pkgname='GBML'
replaces=('slsk-git')
pkgver=v1.4.0.0.r0.ge008c50
pkgrel=1
pkgdesc="Backup utility and database for Linux Steam games"
arch=('x86_64')
url="https://gitlab.com/supremesonicbrazil/GBML"
license=('GPL3')
depends=('qt5-base>=5.5.0')
makedepends=('git' 'sqlite>=3.0')
source=("git+https://gitlab.com/supremesonicbrazil/GBML")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  ./BUILD.sh
}

package() {
  cd ${_pkgname}
  install -Dm755 ./bin/gbml "$pkgdir"/usr/bin/gbml
  install -Dm644 ./bin/SteamLinuxGames.db "$pkgdir"/usr/share/gbml/SteamLinuxGames.db
  install -Dm644 ./bin/gaming-backup-multitool-linux.desktop "$pkgdir"/usr/share/applications/gaming-backup-multitool-linux.desktop
  cp -r ./img "$pkgdir"/usr/share/gbml
}