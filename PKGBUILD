# Maintainer: Robert Greener <robert at agreener dot uk>
pkgname=ubuntu-indicator-weather
_srcname=UbuntuIndicatorWeather
pkgver=0.9
pkgrel=1
pkgdesc="A very simple weather indicator"
arch=('any')
url="https://github.com/kasramp/UbuntuIndicatorWeather"
license=('GPL')
depends=('python>=2.7.0' 'python2-urllib3' 'pygtk' 'libappindicator-gtk2' 'python2-gobject'
				 'hicolor-icon-theme')
source=("${url}/archive/v${pkgver}.tar.gz" "indicator-weather.patch")
sha256sums=('b28ab8151da980b6622b4cc06bbc94316683cd4b58d2950c9c71979062a5e7c9'
						'58a302906716e74879452fe5204a21cf19715edd05bcfd3be4fd0e03b7f040fc')
_iconsizes=("16x16" "32x32" "64x64" "128x128" "256x256")

prepare() {
	cd "$_srcname-$pkgver"
	patch -p1 -i "${srcdir}/indicator-weather.patch"
}

package() {
	cd "$_srcname-$pkgver"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r * "$pkgdir/usr/share/$pkgname"
	mkdir "$pkgdir/usr/share/applications"
	mkdir "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps"
	cp "$pkgdir/usr/share/$pkgname/indicator-weather.desktop" "$pkgdir/usr/share/applications/indicator-weather.desktop"
	ln -s "/usr/share/$pkgname/indicator-weather" "$pkgdir/usr/bin/indicator-weather"

	for i in "${_iconsizes[@]}"
	do
			mkdir -p "$pkgdir/usr/share/icons/hicolor/$i/apps"
			cp "$pkgdir/usr/share/$pkgname/icons/$i/indicator-weather.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/indicator-weather.png"
	done
}
