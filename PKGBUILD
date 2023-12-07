# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-inspect-git
pkgver=0.15.r0.g2e248ce
pkgrel=1
pkgdesc='Tool to get a human-readable representation of Integrity Measurement Architecture file attributes'
arch=('x86_64')
url='https://github.com/mgerstner/ima-inspect'
license=('GPL2')
depends=('ima-evm-utils')
makedepends=('attr' 'tclap')
provides=('ima-inspect')
conflicts=('ima-inspect')
source=("git+https://github.com/mgerstner/ima-inspect")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/ima-inspect"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd ima-inspect
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd ima-inspect
	make DESTDIR="$pkgdir/" install
}
