# Maintainer: Ronny R <ronny-aur[at]adke*org>
pkgname=raumserver-bin
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A app/service/deamon to control the Raumfeld Multiroomsystem via HTTP-Requests"
arch=('armv7h' 'x86_64')
url="https://github.com/ChriD/Raumserver"
license=('unknown')
depends=('libunwind')
makedepends=('unzip')
backup=('opt/raumserverDaemon/settings.xml')
source=("raumserverDaemon.service")
source_armv7h=("http://bassmaniacs.com/data/appBinaries/raumserver/currentVersion/raumserverDaemon_linux_ARMV7HF.zip")
source_x86_64=("http://bassmaniacs.com/data/appBinaries/raumserver/currentVersion/raumserverDaemon_linux_X64.zip")
noextract=("raumserverDaemon_linux_ARMV7HF.zip" "raumserverDaemon_linux_X64.zip")

prepare() {
	rm -rf raumserverDaemon
	mkdir raumserverDaemon
	cd raumserverDaemon
	case "$CARCH" in
		armv7h)
			unzip "../raumserverDaemon_linux_ARMV7HF.zip"
			;;
		x86_64)
			unzip "../raumserverDaemon_linux_X64.zip"
			;;
	esac
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/opt/
	cp -a raumserverDaemon $pkgdir/opt/
	install -D raumserverDaemon.service -t $pkgdir/usr/lib/systemd/system/
}
md5sums=('6b904581addae2b081cf572ac1b882f7')
md5sums_armv7h=('2b882d56bba12b20f18818733f5779b4')
md5sums_x86_64=('7492b99c96573b69e2563d84cc7b1cd0')
