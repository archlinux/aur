# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=genmc
pkgver=0.10.2
pkgrel=1
pkgdesc="Generic model checker for concurrent C programs"
arch=(x86_64)
url="https://plv.mpi-sws.org/genmc"
license=(
	'GPL3' 'custom:Apache 2.0 with LLVM Exception'
)
depends=(
	llvm-libs
	hwloc
)
makedepends=(
	llvm
)
source=("https://github.com/MPI-SWS/genmc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('208c652ee00fecbee52f061020a381c5d8ab80469a074e714cd54f2a04203e7a99e971b484f286034f41d09b85059e7000d0a378d49097ce8c2887d5a9e2de42')

build() {
	cd "$pkgname-$pkgver"

	autoreconf --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	# These tests take a LONG time
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LLVMLICENSE
	install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 *.md doc/*.md
}
