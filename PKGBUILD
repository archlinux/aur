# Maintainer: Blooser <blooser@protonmail.com>
pkgname=mimosa
pkgver=1.1.1
pkgrel=4
pkgdesc="Download manager"
arch=('x86_64')
md5sums=('b0cdb9921560264d423d26f3777a3d29')
url="https://github.com/blooser/mimosa"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake')
applocation=~/Documents/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Mimosa
GenericName=Download manager
Exec=${applocation}/mimosa
Icon[en_US]=${applocation}/icons/mimosa.png
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
	cd ..
	mv $pkgname-$pkgver $pkgname
	cp -r $pkgname ~/Documents
	rm -rf $pkgname		
	echo "${shortcut}" > ~/.local/share/applications/mimosa.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias mimosa=${applocation}/mimosa" >> ~/.zshrc
	else
		echo "alias mimosa=${applocation}/mimosa" >> ~/.bashrc	
	fi	

}

