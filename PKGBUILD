# Maintainer: Blooser <blooser@protonmail.com>
pkgname=mimosa
pkgver=1.1.2
pkgrel=3
pkgdesc="Download manager"
arch=('x86_64')
md5sums=('620184c969713282aab4097273547c0e')
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
Name[en_US]=Mimosa
GenericName=Download manager
Exec=${binlocation}/mimosa
Icon[en_US]=${resourcelocation}/mimosa.png
Type=Application
Categories=Application;Network
Comment[en_US]=Take a glance at your downloads from the Internet
"

source=("https://github.com/blooser/mimosa/archive/v${pkgver}.tar.gz")

build() {
	cd $pkgname-$pkgver
	qmake	
	make
}

package() {
	cd $pkgname-$pkgver
	make clean
	sudo cp mimosa ${binlocation} && sudo mkdir -p ${resourcelocation} && sudo cp icons/mimosa.png ${resourcelocation} 
	cd ..
	rm -rf $pkgname-$pkgver 
	echo "${shortcut}" > ~/.local/share/applications/mimosa.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias mimosa=${binlocation}/mimosa" >> ~/.zshrc
	else
		echo "alias mimosa=${binlocation}/mimosa" >> ~/.bashrc	
	fi	

}

