# Maintainer: Milian Reichardt <mreichardt95@gmail.com>
pkgname=cpuminer-multi-git
pkgver=v1.2.multi.r15.gf9345a5

pkgver() {
	cd "cpuminer-multi"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0) - GIT checkout"
arch=('i686' 'x86_64')
url="https://github.com/tpruvot/cpuminer-multi/"
license=('GPLv2')
depends=('curl' 'jansson')
source=("git+https://github.com/tpruvot/cpuminer-multi.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/cpuminer-multi/"
	./autogen.sh
	./configure CFLAGS="-march=native" --with-crypto --with-curl
	make
}

package() {
	cd "$srcdir/cpuminer-multi/"
	make DESTDIR="$pkgdir/" install
}
