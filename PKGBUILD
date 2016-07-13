# Maintainer: Omar Pakker <omar.pakker@oracle.com>

pkgname=ccminer-git
pkgver=r749.dbb9507
pkgrel=2
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson')
makedepends=('git' 'cuda')
provides=('ccminer')
conflicts=('ccminer')
options=('!emptydirs')
changelog=
source=("git://github.com/tpruvot/ccminer.git#branch=linux")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ccminer"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/ccminer"
	
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --with-cuda=/opt/cuda
	make
}

package() {
	cd "${srcdir}/ccminer"
	
	make DESTDIR="${pkgdir}/" install
}
