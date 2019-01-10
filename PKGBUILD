# Maintainer: Blooser <blooser@protonmail.com>
pkgname=gemini
pkgver=1.8.1
pkgrel=1
pkgdesc="Graphical audio player"
arch=('x86_64')
md5sums=('fd0aa4cbc708a218bec4dd85eff2ee7c')
url="https://github.com/blooser/gemini"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'python')
makedepends=('cmake' 'python-setuptools')
applocation=~/Documents/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Gemini
GenericName=Graphical audio player
Exec=${applocation}/Gemini
Icon[en_US]=${applocation}/content/icons/gemini.png
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
	cd ..
	mv $pkgname-$pkgver $applocation
	echo "${shortcut}" > ~/.local/share/applications/gemini.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias gemini=${applocation}/Gemini" >> ~/.zshrc

	else
		echo "alias gemini=${applocation}/Gemini" >> ~/.bashrc	
	fi	
}

