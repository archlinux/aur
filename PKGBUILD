# Maintainer: Blooser <blooser@protonmail.com>
pkgname=taurus
pkgver=1.2
pkgrel=1
pkgdesc="GUI port scanner"
arch=('x86_64')
md5sums=('956971bed1cdb1953bd6344162177804')
url="https://github.com/blooser/taurus"
license=('MIT')
depends=('qt5-base' 'sfml')
makedepends=('cmake')
applocation=/usr/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Taurus
GenericName=GUI Port Scanner
Exec=${applocation}/taurus
Icon[en_US]=${applocation}/icons/discover.png
Type=Application
Categories=Application;Network
Comment[en_US]=Quick ports scan
"

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
	sudo cp -r $pkgname-$pkgver $applocation
	rm -rf $pkgname-$pkgver		
	echo "${shortcut}" > ~/.local/share/applications/taurus.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias taurus=${applocation}/taurus" >> ~/.zshrc

	else
		echo "alias taurus=${applocation}/taurus" >> ~/.bashrc	
	fi	
}
