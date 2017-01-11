# Maintainer: Pierre-Gildas MILLON <pg.millon@gmail.com>

pkgname=cloudstation-3.0
pkgver=3111
pkgrel=1
pkgdesc="Synology Cloud Station. This version is for DSM versions that only works with CloudStation 3.0 (DSM 4.2 on a DS209 for example)"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('libsm' 'qt5-base')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta')
install=cloudstation.install
source=('synology-cloud-station' 'synology-cloud-station.desktop')
md5sums=('db969c467abb89cb503c11753521c5ca'
         'ad5716993e65b96a104700ffb267da47')

source_i686=(https://global.download.synology.com/download/Tools/CloudStationDrive/3.0-${pkgver}/Linux/Installer/i686/CloudStation-Linux-Installer-${pkgver}-32bit.tgz)
md5sums_i686=('e65e4cdf1e6a2ccee9bc470743382419')
source_x86_64=(http://global.download.synology.com/download/Tools/CloudStationDrive/3.0-${pkgver}/Linux/Installer/x86_64/CloudStation-Linux-Installer-${pkgver}-64bit.tgz)
md5sums_x86_64=('2c0d3e41e7bc91e308e9c2eb01b9dd7f')

prepare() {
	cd "$srcdir/CloudStation-Linux-Installer-$pkgver"
	tar xf CloudStation.spkg
	tar xf CloudStation.tgz
}

package() {
	cd "$srcdir/CloudStation-Linux-Installer-$pkgver"
	mkdir -p "$pkgdir/opt/Synology"
	cp -r "CloudStation-app" "$pkgdir/opt/Synology/CloudStation"

	install -Dm755 libnautilus-cloud-extension.so "$pkgdir/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
	install -Dm755 "$srcdir/synology-cloud-station" "$pkgdir/usr/bin/synology-cloud-station"

	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/emblems"
	cp -r "CloudStation-app/images/emblems/"* "$pkgdir/usr/share/icons/hicolor/scalable/emblems"

	install -Dm644 "$srcdir/synology-cloud-station.desktop" "$pkgdir/usr/share/applications/synology-cloud-station.desktop"
}
