# Maintainer: Blooser <blooser@protonmail.com>
pkgname=taurus
pkgver=1.3
pkgrel=1
pkgdesc="Port scanner for a quick and plain scan."
arch=('x86_64')
md5sums=('63fe00ac5be6a6dd694548e3ad8b1349')
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
GenericName=Quick port scanner
Exec=${binlocation}/taurus
Icon[en_US]=${resourcelocation}/discover.png
Type=Application
Categories=Application;Network
Comment[en_US]=Quick and plain port scanning
"

source=("https://github.com/blooser/taurus/archive/v${pkgver}.tar.gz")

build() {
	cd $pkgname-$pkgver/taurus
	qmake	
	make
}

package() {
	cd $pkgname-$pkgver/taurus
	make clean
	sudo cp taurus ${binlocation} && sudo mkdir -p ${resourcelocation}  && sudo cp resources/icons/discover.png ${resourcelocation} 
	cd ../..
	rm -rf $pkgname-$pkgver 
	echo "${shortcut}" > ~/.local/share/applications/taurus.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias taurus=${binlocation}/taurus" >> ~/.zshrc
	else
		echo "alias taurus=${binlocation}/taurus" >> ~/.bashrc	
	fi	
}


