# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=msk
pkgver=0.0.2
pkgrel=1
pkgdesc='A music synchronization CLI tool'
arch=('x86_64')
url='https://codeberg.org/ivan.zaera/msk'
license=('GPL-3.0-or-later')
depends=(
	'ffmpeg'
	'sox'
)
makedepends=(
	'coreutils'
	'rust'
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("0dff205465272118432f76f526eb42fb3a61719548c455f4812645d2d861e0dd")

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
	cp -ar rust/target/release/msk $pkgdir/usr/bin
}
