# Maintainer: John FrostFox <john.frostfox at gmail dot com>
_host=https://raw.githubusercontent.com/minershive
_repo=hiveos-linux
_folder=hive/opt/opendev
_pkgname=watchdog-opendev
_hash=da495e5bcca247c48669a10fe83143faab84c31a
pkgname=$_pkgname
pkgver=0.5.66
pkgrel=2
pkgdesc="Terminal utility for OpenDev's Watchdogs from HiveOS. Includes heartbeat service."
arch=(any)
url="https://github.com/minershive/hiveos-linux/tree/master/hive/opt/opendev"
license=('unknown')
depends=(sh)
#optdepends=('hive-watchdog: watchdog sevice (no package yet)')
source=(watchdog-opendev-heartbeat.service watchdog-opendev-ping-loop.sh "${_host}/${_repo}/$_hash/$_folder/${_pkgname}" "${_host}/${_repo}/$_hash/$_folder/${_pkgname}.sh")
noextract=()
sha256sums=(e3d782436c8b1d8d414190e6b048a507961b7d5763e4172938a4d903f3ad0637 f7524a2a7c1253c6136e0d5038ea4af75510d53ba71ebc9e78618930ddbddf34 15bc7117839c1ccded2b27b15155fdcb3d84221c3daf4c1d69744b6cb22c6118 8b822a64bcba0e10e77ccb37b552a4ad5a9e7b296ad963284da59bbf42f9b12c)
#install=message.install

build() {
	cd "$srcdir"
	sed -i 's/watchdog-opendev.sh/watchdog-opendev-pinger/' watchdog-opendev.sh
	sed -i 's~/hive/opt/opendev/watchdog-opendev~/usr/bin/watchdog-opendev~' watchdog-opendev.sh
}

package() {
  cd "$srcdir"
  install -Dm755 ${_pkgname}.sh "$pkgdir/usr/bin/${_pkgname}-prober"
  install -Dm755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 ../${_pkgname}-ping-loop.sh "$pkgdir/usr/bin/${_pkgname}-ping-loop.sh"
  install -Dm644 ../${_pkgname}-heartbeat.service "$pkgdir/usr/lib/systemd/system/${_pkgname}-heartbeat.service"
}
