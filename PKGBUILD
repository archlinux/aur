# Maintainer: Blooser <blooser@protonmail.com>
pkgname=lyra
pkgver=1.6.2
pkgrel=1
pkgdesc="A wonderful 3D cryptocurrency analyzer"
arch=('x86_64')
md5sums=('177948e8563eb50d11e37e6014d325e0')
url="https://github.com/blooser/lyra"
license=('MIT')
depends=('python3')
makedepends=('python-setuptools')
applocation=~/.local/share/$pkgname
shortcut="
[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name[en_US]=Lyra
GenericName=Wonderful 3D Cryptocurrency analyzer
Exec=${applocation}/run.sh
Icon[en_US]=${applocation}/icons/coins.png
Type=Application
Categories=Application;Network
Comment[en_US]=Analyze and track cryptocurrency
"

runscript="
cd ${applocation}
python3 main.py
"

source=("https://github.com/blooser/lyra/archive/v${pkgver}.tar.gz")

build() {
	sudo pip install PyQt5 PyQtDataVisualization pandas numpy quandl 		
}

package() {
	echo "${runscript}" > $pkgname-$pkgver/run.sh	
	chmod +x $pkgname-$pkgver/run.sh
	mv $pkgname-$pkgver $pkgname && mv $pkgname ~/.local/share
	echo "${shortcut}" > ~/.local/share/applications/lyra.desktop
	if [ -f ~/.zshrc ]; then
		echo "alias lyra=${applocation}/run.sh" >> ~/.zshrc
	else
		echo "alias lyra=${applocation}/run.sh" >> ~/.bashrc	
	fi
}



