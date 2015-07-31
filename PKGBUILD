# Maintainer: Artur Kowalski <arturdeb@gmail.com>
pkgname=digital-clock
pkgver=1.0.0
pkgrel=1
pkgdesc="This application is a small clock widget for Linux desktop."
arch=('i686' 'x86_64')
licence=('LGPL')
depends=('qt5-base>=5.4')
optdepends=('git')

build() {
	git clone https://github.com/Oficerx/Digital-clock.git
	cd $srcdir/Digital-clock
	
	printf "\e[1;31mChose 1 for building from source and 2 for downloading ready binary\e[0m"
	read VAL

	if [ $VAL == "1" ]
	then
		qmake -o Makefile digital_clock.pro
		make
	else
		cp bin/dclock-$(uname -m) digital_clock
	fi
}

package() {	
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/Digital-clock/digital_clock $pkgdir/usr/bin/dclock
}
