# Maintainer: Milian Reichardt <mreichardt95@gmail.com>
pkgname=cpuminer-multi-git
pkgver=v1.3.1.multi.r0.gcce747e

pkgver() {
	cd "cpuminer-multi"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=2
pkgdesc="Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0) - GIT checkout"
arch=('i686' 'x86_64')
url="https://github.com/tpruvot/cpuminer-multi/"
license=('GPLv2')
replaces=('cpuminer-multi')
depends=('curl' 'jansson')
source=("git+https://github.com/tpruvot/cpuminer-multi.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/cpuminer-multi/"
	./autogen.sh
	./configure CFLAGS="-O2 -DUSE_ASM -pg -Ofast -flto -fuse-linker-plugin -ftree-loop-if-convert-stores -march=native" --with-crypto --with-curl --bindir=/usr/bin --libdir=/usr/lib --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/cpuminer-multi/"
	make DESTDIR="$pkgdir/" install
}
