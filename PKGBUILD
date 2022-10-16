# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgver=0.0.4
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
sha256sums=("ba3f2b4c29885b7c97c7a815d89749f63019ec87ce042db62afdd1e63d2a3e46")

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
	cd $srcdir/$pkgname-$pkgver

	cp -arv arch/root/* $pkgdir

	mkdir -p $pkgdir/usr/lib/bautista
	cp -arv node/bautista/*.js $pkgdir/usr/lib/bautista
	cp -ar node/node_modules $pkgdir/usr/lib/bautista
}
