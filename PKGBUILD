# Maintainer: Blooser <blooser@protonmail.com>
pkgname=taurus
pkgver=1.2.1
pkgrel=2
pkgdesc="GUI port scanner"
arch=('x86_64')
md5sums=('0681ec14f699d55ccc052d4c958945fc')
url="https://github.com/blooser/taurus"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake')
binlocation=/usr/bin
resourcelocation=/usr/share/taurus
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Taurus
GenericName=GUI Port Scanner
Exec=${binlocation}/taurus
Icon[en_US]=${resourcelocation}/discover.png
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
	sudo cp taurus ${binlocation} && sudo mkdir -p ${resourcelocation}  && sudo cp icons/discover.png ${resourcelocation} 
	cd ..
	rm -rf $pkgname-$pkgver 
	echo "${shortcut}" > ~/.local/share/applications/taurus.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias taurus=${binlocation}/taurus" >> ~/.zshrc
	else
		echo "alias taurus=${binlocation}/taurus" >> ~/.bashrc	
	fi	
}

