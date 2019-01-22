# Maintainer: Blooser <blooser@protonmail.com>
pkgname=gemini
pkgver=1.10.5
pkgrel=1
pkgdesc="Graphical audio player"
arch=('x86_64')
md5sums=('3001e42e4d1ec6d90efa63b4af3d48a0')
url="https://github.com/blooser/gemini"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-webengine' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'python')
makedepends=('cmake' 'python-setuptools')
applocation=~/.local/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Gemini
GenericName=Graphical audio player
Exec=${applocation}/Gemini
Icon[en_US]=${applocation}/gemini.png
Type=Application
Categories=Application;AudioVideo
Comment[en_US]=Take a break and listen to music while looking at wallpapers
"

source=("https://github.com/blooser/gemini/archive/v${pkgver}.tar.gz")

build() {
	sudo pip install beautifulsoup4
	cd $pkgname-$pkgver
	qmake	
	make
}

package() {
	cd $pkgname-$pkgver
	make clean	
	mv Gemini ${applocation}
	cp content/icons/gemini.png ${applocation}
	cd ..
	rm -rf $pkgname-$pkgver	
	echo "${shortcut}" > ~/.local/share/applications/gemini.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias gemini=${applocation}/Gemini" >> ~/.zshrc
	else
		echo "alias gemini=${applocation}/Gemini" >> ~/.bashrc	
	fi	
}



