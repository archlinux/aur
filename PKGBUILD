# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgver=0.0.3
pkgrel=1
pkgdesc='A domotic butler bot'
arch=('any')
url='https://github.com/joshi-stuff/bautista'
license=('GPL3')
depends=(
	'nodejs'
)
makedepends=(
	'coreutils'
	'npm'
	'shadow'
)
backup=(
	'etc/bautista/config.json'
	'etc/bautista/creds.json'
)
install='install.sh'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/joshi-stuff/bautista/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("a8f5eb43a9ec4566ee4410647dfdc90769e1b5160bb661e083dcaccef19f875b")

prepare() {
	rm -f $srcdir/root
	ln -s $startdir/root $srcdir/root
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make clean
	make build
}

check() {
	cd $srcdir/$pkgname-$pkgver
	make lint
	make test
}

package() {
	cd $srcdir
	cp -arv ../root/* $pkgdir

	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/lib/bautista
	cp -arv node/bautista/*.js $pkgdir/usr/lib/bautista
	cp -ar node/node_modules $pkgdir/usr/lib/bautista
}
