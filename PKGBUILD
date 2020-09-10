# Maintainer: John FrostFox <john.frostfox at gmail dot com>
_host=https://raw.githubusercontent.com/minershive
_repo=hiveos-linux
_folder=hive/opt/opendev
_pkgname=watchdog-opendev
_hash=da495e5bcca247c48669a10fe83143faab84c31a
pkgname=$_pkgname
pkgver=0.5.66
pkgrel=1
pkgdesc="Terminal configuration utility for OpenDev's Watchdogs from HiveOS."
arch=(any)
url="https://github.com/minershive/hiveos-linux/tree/master/hive/opt/opendev"
license=('unknown')
depends=(sh)
#optdepends=('hive-watchdog: watchdog sevice (no package yet)')
source=("${_host}/${_repo}/$_hash/$_folder/${_pkgname}" "${_host}/${_repo}/$_hash/$_folder/${_pkgname}.sh")
noextract=()
sha256sums=(15bc7117839c1ccded2b27b15155fdcb3d84221c3daf4c1d69744b6cb22c6118 8b822a64bcba0e10e77ccb37b552a4ad5a9e7b296ad963284da59bbf42f9b12c)
#install=message.install

build() {
	cd "$srcdir"
	sed -i 's/watchdog-opendev.sh/watchdog-opendev-pinger/' watchdog-opendev.sh
	sed -i 's~/hive/opt/opendev/watchdog-opendev~/usr/bin/watchdog-opendev~' watchdog-opendev.sh
}

package() {
  cd "$srcdir"
  install -Dm 755 ${_pkgname}.sh "$pkgdir/usr/bin/${_pkgname}-pinger"
  install -Dm 755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
#  echo "To run opendev watchdog pinger, use watchdog-opendev-pinger."
}
