# Maintainer: Tyler Anderson <unlimitedbacon@gmail.com>

pkgname=mattercontrol-plugins
_pkgname=MatterControl
pkgver=1.7.0
pkgrel=1
pkgdesc="Closed source plugins for MatterControl"
arch=("i386" "x86_64")
license=('custom')
url="http://www.mattercontrol.com"
depends=('mattercontrol')
provides=('mattercontrol-plugins')
source=("MatterControlSetup-1.7.0.tar.gz::https://mattercontrol.appspot.com/downloads/development/ag9zfm1hdHRlcmNvbnRyb2xyQQsSB1Byb2plY3QYgICAiOCSzAsMCxINUHVibGljUmVsZWFzZRiAgICgsdyLCgwLEgZVcGxvYWQYgICAoK3hngoM"
        "websocket4net.0.15.0-beta7.nupkg::https://www.nuget.org/api/v2/package/WebSocket4Net/0.15.0-beta7")
sha256sums=('2e975a7e97c7e747c2245ffd7e975b248b5ef9f0ca83e90248b6b7f8008e1568'
            'f001300c03dfe7cc8f768be76491cd9da72286d0c8c935456b885b7d8b6cec9b')

build() {
	cd "${srcdir}"
	ar -x "mattercontrol-1.7/mattercontrol-1.7.deb"
	tar -xvf data.tar.xz

	# Fix for https://github.com/MatterHackers/MatterControl/issues/1989
	unzip websocket4net.0.15.0-beta7.nupkg -d websocket4net
}

package() {
	cd "${srcdir}/usr/lib/MatterControl"
	install -d "$pkgdir/usr/lib/mattercontrol/"

	# Plugins
	cp CloudServices.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp MarlinFirmwareUpdatePlugin.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp MatterControlAuth.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp Mono.Nat.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp PictureCreator.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp PrintNotifications.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp TcpipDriver.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp X3GDriver.dll* "$pkgdir/usr/lib/mattercontrol/"

	# Libraries
	cp EngineIoClientDotNet.dll* "$pkgdir/usr/lib/mattercontrol/"
	cp SocketIoClientDotNet.dll* "$pkgdir/usr/lib/mattercontrol/"
	cd "${srcdir}/websocket4net/lib/net45"
	cp WebSocket4Net.dll* "$pkgdir/usr/lib/mattercontrol/"

}
