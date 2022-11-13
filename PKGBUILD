# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgver=0.0.12
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
	'pkgconf'
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
sha256sums=("2c329bdd5ba26e9590730afb61375d8cef291aaf609754331320bbc297bf9df2")

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
	cp -arv rust/target/debug/bautista-bot $pkgdir/usr/lib/bautista

	mkdir -p $pkgdir/usr/lib/bautista/meross-bridge
	cp -arv node/meross-bridge/*.js $pkgdir/usr/lib/bautista/meross-bridge
	cp -ar node/node_modules $pkgdir/usr/lib/bautista
}
