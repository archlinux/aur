# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=ministore
pkgver=2.0.0
pkgrel=1
pkgdesc='Mini keyring store based on GnuPG'
arch=('any')
url='https://codeberg.org/ivan.zaera/ministore'
license=('GPL-3.0-or-later')
depends=(
	'bash'
	'findutils'
	'gnupg'
	'grep'
	'sed'
)
makedepends=(
	'coreutils'
)

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("9c720d92968ff9a46a67f585ab2f77ae423ec5096d7b55e8d1b8bdd18c2b0a3f")

build() {
	cd $srcdir/$pkgname
	make clean
	make MODE=release build
}

check() {
	cd $srcdir/$pkgname
	make lint
	make test
}

package() {
	cd $srcdir/$pkgname

	mkdir -p $pkgdir/usr/bin
	cp -a bash/ministore $pkgdir/usr/bin

	mkdir -p $pkgdir/usr/lib/ministore
	cp -a bash/functions.sh $pkgdir/usr/lib/ministore
	cp -a bash/git-functions.sh $pkgdir/usr/lib/ministore

	mkdir -p $pkgdir/usr/lib/git-core
	cp -a bash/git-credential-ministore $pkgdir/usr/lib/git-core

	mkdir -p $pkgdir/usr/share/ministore/samples
	cp -ar samples/* $pkgdir/usr/share/ministore/samples
}
