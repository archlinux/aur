# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgver=0.0.8
pkgrel=1
pkgdesc='A domotic butler bot'
arch=('pentium4' 'x86_64')
url='https://github.com/joshi-stuff/bautista'
license=('GPL3')
depends=(
	'nodejs'
)
makedepends=(
	'coreutils'
	'npm'
	'rust'
	'shadow'
)
backup=(
	'etc/bautista/config.toml'
)
install='install.sh'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/joshi-stuff/bautista/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("7d5f7291bd1aa59bc9d46a5559b8f08f5c210588d04d8832d572df8513f9b864")

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

	mkdir -p $pkgdir/usr/bin
	cp -arv rust/target/debug/bautista-bot $pkgdir/usr/bin/bautista

	mkdir -p $pkgdir/usr/lib/bautista/meross-bridge
	cp -arv node/meross-bridge/*.js $pkgdir/usr/lib/bautista/meross-bridge
	cp -ar node/node_modules $pkgdir/usr/lib/bautista
}
