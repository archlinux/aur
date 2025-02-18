# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=plumero
pkgver=0.0.1
pkgrel=1
pkgdesc='A command line tool to tidy up home and /etc folders.'
arch=('pentium4' 'x86_64')
url='https://codeberg.org/ivan.zaera/plumero'
license=('GPL-3.0-or-later')
depends=(
	'bash'
	'coreutils'		# cut, printf, tail
	'findutils'		# find
	'grep'
	'ncurses'		# tput
	'pacman'
)
makedepends=(
	'coreutils'
	'scdoc'
)
backup=(
	etc/plumero/config
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("73df36d5970247db9a93096c0c87425632d6576a8edd695a8ee266656ae26da5")

build() {
	cd $srcdir/$pkgname
	make MODE=release build
}

check() {
	cd $srcdir/$pkgname
	make lint
	make test
}

package() {
	cd $srcdir/$pkgname

	cp -arv root/* $pkgdir
	# cp -arv arch/root/* $pkgdir

	mkdir -p $pkgdir/usr/bin
	cp -arv bash/plumero $pkgdir/usr/bin/plumero

	mkdir -p $pkgdir/usr/lib/plumero
	cp -arv bash/*.bash $pkgdir/usr/lib/plumero

	mkdir -p $pkgdir/usr/share/man/man1
	cp -arv man/build/plumero.1.gz $pkgdir/usr/share/man/man1
}
