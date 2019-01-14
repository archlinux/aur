# Maintainer: Blooser <blooser@protonmail.com>
pkgname=mimosa
pkgver=1.1.2
pkgrel=2
pkgdesc="Download manager"
arch=('x86_64')
md5sums=('620184c969713282aab4097273547c0e')
url="https://github.com/blooser/mimosa"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake')
applocation=~/$pkgname
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
	mv $pkgname-$pkgver ~/$pkgname
	echo "${shortcut}" > ~/.local/share/applications/mimosa.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias mimosa=${applocation}/mimosa" >> ~/.zshrc
	else
		echo "alias mimosa=${applocation}/mimosa" >> ~/.bashrc	
	fi	

}


