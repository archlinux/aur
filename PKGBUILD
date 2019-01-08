# Maintainer: Blooser <blooser@protonmail.com>
pkgname=taurus
pkgver=1.1
pkgrel=1
pkgdesc="GUI port scanner"
arch=('x86_64')
url="https://github.com/blooser/taurus"
license=('MIT')
depends=('qt5-base' 'sfml')
makedepends=('cmake')
applocation=/usr/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=1.1
Name[en_US]=Taurus
GenericName=GUI Port Scanner
Exec=${applocation}/./Taurus
Icon[en_US]=${applocation}/icons/discover.png
Type=Application
Categories=Application;Network
Comment[en_US]=Quick ports scan
"
md5sums=('db8e4732acfe2000d0bd1fe083a26a6813f0522f')

source=("https://github.com/blooser/taurus/archive/v${pkgver}.tar.gz")

build() {
	cd $pkgname-$pkgver
	qmake	
	make
}

package() {
	cd $pkgname-$pkgver
	make clean
	cd ..
	sudo mv $pkgname-$pkgver $applocation		
	echo "${shortcut}" > ~/.local/share/applications/taurus.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias taurus=${applocation}/./Taurus" >> ~/.zshrc
	else
		echo "alias taurus=${applocation}/./Taurus" >> ~/.bashrc
	fi		
}
