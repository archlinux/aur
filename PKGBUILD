# Maintainer: Blooser <blooser@protonmail.com>
pkgname=gemini
pkgver=1.15
pkgrel=1
pkgdesc="Audio player with wallpaper changer."
arch=('x86_64')
md5sums=('273ba7465dfacec19e28961f84bfdbea')
url="https://github.com/blooser/gemini"
license=('MIT')
depends=('mpv' 'youtube-dl' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'python')
makedepends=('cmake')
binlocation=/usr/bin
resourcelocation=/usr/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Gemini
GenericName=Graphical audio player
Exec=${binlocation}/Gemini
Icon=${resourcelocation}/gemini.png
Type=Application
Categories=Application;AudioVideo
Comment[en_US]=Take a break and listen to your best music while looking at wonderful wallpapers
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
	sudo cp Gemini ${binlocation} && sudo mkdir -p ${resourcelocation} && sudo cp resources/icons/gemini.png ${resourcelocation}
	cd ..
	rm -rf $pkgname-$pkgver	
	echo "${shortcut}" > ~/.local/share/applications/gemini.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias gemini=${binlocation}/Gemini" >> ~/.zshrc
	else
		echo "alias gemini=${binlocation}/Gemini" >> ~/.bashrc	
	fi	
}



