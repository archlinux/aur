# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgver=0.0.7
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
	'shadow'
	'yarn'
)
backup=(
	'etc/bautista/config.toml'
)
install='install.sh'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/joshi-stuff/bautista/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("5631f2c2001353bd489b0e2830bc90143a61f35295e18d6c7ebbbe85d5b859dc")

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
