# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Omar Pakker <omar.pakker@oracle.com>

pkgname=ccminer
pkgver=1.8.1
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson')
options=('!emptydirs')
source=("https://github.com/tpruvot/ccminer/archive/${pkgver}-tpruvot.tar.gz")
md5sums=('6f17eda5c42eff4ac13f217038da74f4')

build() {
	cd "${srcdir}/ccminer-${pkgver}-tpruvot"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --with-cuda=/opt/cuda
	make
}

package() {
	cd "${srcdir}/ccminer-${pkgver}-tpruvot"

	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
