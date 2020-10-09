# Maintainer: jiahuiz <jiahuizhuo1998@gmail.com>


pkgname=x11iraf
pkgver=2.00
pkgrel=1
pkgdesc="X11/GUI development utilities and applications developed by the IRAF Project"
arch=('i686' 'x86_64')
url="https://github.com/iraf-community/x11iraf"
license=('MIT')
groups=()
depends=('libxaw' 'libxmu' 'tcl' 'xaw3d' 'libxpm')
optdepends=()
makedepends=('git')
backup=()
install="$pkgname.install"

source=('git+https://github.com/iraf-community/x11iraf') 

md5sums=('SKIP')

build(){
	cd "$pkgname"
	grep -rli 'tcl/tcl.h' * | xargs -i@ sed -i 's#tcl/tcl.h#tcl.h#g' @
	make
}

package() {
	cd "$pkgname"
	sed -i "/tic/d" ./Makefile
	sed -i "s#}/man#}/share/man#g" ./Makefile
	make PREFIX="$pkgdir/usr/" install
	mkdir -p $pkgdir/usr/share/$pkgname
	cp $srcdir/$pkgname/xgterm/xgterm.terminfo $pkgdir/usr/share/$pkgname
}

