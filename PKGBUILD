# Maintainer: supremesonicbrazil AKA TheSupremist <supreminho2 at gmail dot com>

pkgname=slsk-git
_pkgname='SLSK'
pkgver=v1.3.2.1
pkgrel=1
pkgdesc="A backup utility and database for Linux Steam games"
arch=('x86_64')
url="https://github.com/supremesonicbrazil/SLSK"
license=('GPL3')
depends=('qt5-base>=5.5' 'sqlite>=3.0')
makedepends=('git')
source=("git+https://github.com/supremesonicbrazil/SLSK")
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
  install -Dm755 ./bin/SteamLinuxSwissKnife "$pkgdir"/usr/bin/slsk
  install -Dm644 ./bin/SteamLinuxGames.db "$pkgdir"/usr/share/slsk/SteamLinuxGames.db
  install -Dm644 ./steam-linux-swiss-knife.desktop "$pkgdir"/usr/share/applications/steam-linux-swiss-knife.desktop
  cp -r ./img "$pkgdir"/usr/share/slsk
}