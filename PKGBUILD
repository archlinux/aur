# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ima-inspect-git
pkgver=v0.14.r0.g05db29b
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
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
