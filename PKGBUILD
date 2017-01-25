
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell
pkgver=6.0
pkgrel=0
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 
'networkmanager' 'xorg-xbacklight' 'redshift' 'tsscreenlock' 
'libcups' 'qt5-base' 'ts-qtplatform' 'the-libs' 'qt5-charts'
'qt5-location' 'kscreen' 'kdepimlibs4' 'akonadi' 'ts-polkitagent' 'ts-bt')
optdepends=('alsa-utils: for volume controls'
	    'pocketsphinx: for theWave'
	    'festival: for theWave')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theshell#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qdbuscpp2xml -M -s notificationdbus.h -o org.freedesktop.Notifications.xml
	qdbuscpp2xml -a -o org.thesuite.power.xml upowerdbus.h
	qmake theShell.pro
	make
}

package() {
	chmod +x "$pkgname-$pkgver/init_theshell"
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/theshell" "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/init_theshell" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/xsessions"
	cp "$pkgname-$pkgver/theshell.desktop" "$pkgdir/usr/share/xsessions"
	mkdir -p "$pkgdir/usr/share/theshell/translations"
	cp "$pkgname-$pkgver/translations/"* "$pkgdir/usr/share/theshell/translations"
}
