# Maintainer: Blooser <blooser@protonmail.com>
pkgname=cygnus
pkgver=1.3
pkgrel=4
pkgdesc="RSS reader"
arch=('x86_64')
md5sums=('26cfda2c5b20496debe039d94207404d')
url="https://github.com/blooser/cygnus"
license=('MIT')
depends=('python3')
makedepends=('python-setuptools')
applocation=~/.local/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Cygnus
GenericName=RSS reader
Exec=${applocation}/run.sh
Icon[en_US]=${applocation}/icons/rss.png
Type=Application
Categories=Application;Network
Comment[en_US]=Be always up to date
"

runscript="
cd ${applocation}
python3 main.py
"

source=("https://github.com/blooser/cygnus/archive/v${pkgver}.tar.gz")

build() {
	sudo pip install PyQt5 pygame feedparser pillow 		
}

package() {
	echo "${runscript}" > $pkgname-$pkgver/run.sh	
	chmod +x $pkgname-$pkgver/run.sh
	mv $pkgname-$pkgver $pkgname && mv $pkgname ~/.local/share 
	echo "${shortcut}" > ~/.local/share/applications/cygnus.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias cygnus=${applocation}/run.sh" >> ~/.zshrc
	else
		echo "alias cygnus=${applocation}/run.sh" >> ~/.bashrc	
	fi	
}
