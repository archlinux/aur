_pkgname=ccdciel
pkgname=ccdciel-git
pkgver=v0.9.84.104.g6073061e
pkgrel=1
pkgdesc="A CCD capture software intended for the amateur astronomer. Git version"
arch=('x86_64')
license=('GPL')
depends=('qt5pas' 'libpasastro')
makedepends=('qt5pas' 'fpc' 'lazarus')
conflicts=('ccdciel')
url="https://www.ap-i.net/ccdciel//en/start"
source=("git+https://github.com/pchev/ccdciel.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --always | sed 's/-/./g'
}

build() {
	cd "${_pkgname}"
	fpc="/usr/lib/fpc/""`fpc -iV`""/units/x86_64-linux/"
	echo fpc=$fpc
	echo ./configure fpc="$fpc" lazarus=/usr/lib/lazarus prefix="$pkgdir/usr" target=x86_64-linux 
	./configure fpc="$fpc" lazarus=/usr/lib/lazarus prefix="$pkgdir/usr" target=x86_64-linux 
	make CPU_TARGET=x86_64 OS_TARGET=linux clean
	make CPU_TARGET=x86_64 OS_TARGET=linux -j 1
}

package() {
	cd "${_pkgname}"
	echo pkgdir $pkgdir
	mkdir -p "$pkgdir/usr"
	make install
}
