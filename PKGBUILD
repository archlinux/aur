# Maintainer: Blooser <blooser@protonmail.com>
pkgname=mimosa
pkgver=1.2
pkgrel=1
pkgdesc="Download manager"
arch=('x86_64')
md5sums=('3f680139a420b4325843e3ebcc6fe691')
url="https://github.com/blooser/mimosa"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake')
binlocation=/usr/bin
resourcelocation=/usr/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name=Mimosa
GenericName=Download manager
Exec=${binlocation}/mimosa
Icon=${resourcelocation}/mimosa.png
Type=Application
Categories=Application;Network
Comment=Take a glance at your downloads from the Internet
"

source=("https://github.com/blooser/mimosa/archive/v${pkgver}.tar.gz")

build() {
	cd $pkgname-$pkgver/mimosa	
	ls
	qmake	
	make
}

package() {
	cd $pkgname-$pkgver/mimosa
	make clean
	sudo cp mimosa ${binlocation} && sudo mkdir -p ${resourcelocation} && sudo cp resources/mimosa.png ${resourcelocation} 
	cd ../..
	rm -rf $pkgname-$pkgver 
	echo "${shortcut}" > ~/.local/share/applications/mimosa.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias mimosa=${binlocation}/mimosa" >> ~/.zshrc
	else
		echo "alias mimosa=${binlocation}/mimosa" >> ~/.bashrc	
	fi	

}

