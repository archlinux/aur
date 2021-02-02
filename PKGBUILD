# Maintainer: John FrostFox <john.frostfox at gmail dot com>
_host=https://raw.githubusercontent.com/minershive
_repo=hiveos-linux
_folder=hive/opt/opendev
_pkgname=watchdog-opendev
_hash=a2225df4d02c2db8b98ab565ad4886d4b550694b
pkgname=$_pkgname
pkgver=0.5.66
pkgrel=3
pkgdesc="Terminal utility for OpenDev's Watchdogs from HiveOS. Includes heartbeat service."
arch=(any)
url="https://github.com/minershive/hiveos-linux/tree/master/hive/opt/opendev"
license=('unknown')
depends=(sh)
#optdepends=('hive-watchdog: watchdog sevice (no package yet)')
source=(watchdog-opendev-heartbeat.service watchdog-opendev-ping-loop.sh "${_host}/${_repo}/$_hash/$_folder/${_pkgname}" "${_host}/${_repo}/$_hash/$_folder/${_pkgname}.sh")
noextract=()
sha256sums=(e3d782436c8b1d8d414190e6b048a507961b7d5763e4172938a4d903f3ad0637 f7524a2a7c1253c6136e0d5038ea4af75510d53ba71ebc9e78618930ddbddf34 1e8baa88d14b4cbe3c76a38d7b51d3dbfdf4efb2cd100ae72866a99c0d164623 8b822a64bcba0e10e77ccb37b552a4ad5a9e7b296ad963284da59bbf42f9b12c)
#install=message.install

build() {
	cd "$srcdir"
	sed -i 's/watchdog-opendev.sh/watchdog-opendev-prober/' watchdog-opendev.sh
	sed -i 's~/hive/opt/opendev/watchdog-opendev~/usr/bin/watchdog-opendev~' watchdog-opendev.sh
}

package() {
  cd "$srcdir"
  install -Dm755 ${_pkgname}.sh "$pkgdir/usr/bin/${_pkgname}-prober"
  install -Dm755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 ../${_pkgname}-ping-loop.sh "$pkgdir/usr/bin/${_pkgname}-ping-loop.sh"
  install -Dm644 ../${_pkgname}-heartbeat.service "$pkgdir/usr/lib/systemd/system/${_pkgname}-heartbeat.service"
}
