#Maintainer: Andreas B. Wagner <AndreasBWagner@gmail.com>

pkgname=cook
pkgver=2.34
pkgrel=1
pkgdesc="A powerful make alternative"
arch=('i686' 'x86_64')
url=http://miller.emu.id.au/pmiller/software/cook/
license=('GPLv3')
depends=('groff>=1.15' 'bison')
source=(http://miller.emu.id.au/pmiller/software/cook/$pkgname-$pkgver.tar.gz)

build() {
	# Parallel builds (-j<i> : i>1) break recipes which have dependancies
	# between their commands. (ie. 'sed [..] <file>' followed by 'rm <file>') 
	unset MAKEFLAGS

	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make -j1 || return 1
	make -B DESTDIR="$pkgdir" install || return 1
}

md5sums=('9ec89c0f983213696fa0dd59c05e66ba')
