# Contributor: MCMic <come@chilliet.eu>

pkgname=deadascend
pkgver=1.1.1
pkgrel=1
pkgdesc="A 2D point'n'click-like adventure game written in Qt/QML and Javascript"
arch=('any')
url="http://blackgrain.dk/games/deadascend/"
license=('MIT')
depends=('sdl' 'sdl_mixer' 'qt5-base')
makedepends=()
conflicts=()
source=("https://github.com/Larpon/DeadAscend/archive/v${pkgver}.tar.gz"
	"https://github.com/Larpon/qak/archive/v1.4.0.tar.gz"
	"https://github.com/Larpon/QtFirebase/archive/v1.3.3.tar.gz")
md5sums=('6aee59e1027504cdeb4dcbc843f9b757'
	 '1e706acbd639d31f414250203d900364'
         'b9b15aa61d6460be64d4264eacdccf36')

build() {
	cd $srcdir/DeadAscend-${pkgver}
	
	cp -r $srcdir/qak-1.4.0 ./extensions/qak
	cp -r $srcdir/QtFirebase-1.3.3 ./extensions/QtFirebase

	qmake DeadAscend.pro
	make -C App -B assets
	make
}

package() {
	cd $srcdir/DeadAscend-${pkgver}

	make install INSTALL_ROOT=$pkgdir
	cp App/assets.rcc $pkgdir/opt/DeadAscend/bin/
	mkdir -p $pkgdir/usr/bin
	echo -e "#!/bin/sh\ncd /opt/DeadAscend/bin && ./DeadAscend" > $pkgdir/usr/bin/deadascend
	chmod +x $pkgdir/usr/bin/deadascend
}
