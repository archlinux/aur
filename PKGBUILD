# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgver=0.0.5
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
	'yarn'
)
backup=(
	'etc/bautista/config.json'
	'etc/bautista/creds.json'
)
install='install.sh'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/joshi-stuff/bautista/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("038107e5a6ac82c7d9d902518fdd0acfc7d27e6c1bcfb5186b986582fb626193")

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
