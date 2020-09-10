# Maintainer: Daniel Plank <tyrolyean@escpe.net>
pkgname=trx
pkgver=0.5
pkgrel=2
pkgdesc="Realtime audio over IP"
arch=("x86_64" "i686" "aarch64" "amv7l")
url="http://www.pogo.org.uk/~mark/trx/"
license=('GPL')
depends=('opus' 'alsa-lib' 'ortp' 'bctoolbox')
provides=(trx)
source=("http://www.pogo.org.uk/~mark/$pkgname/releases/$pkgname-$pkgver.tar.gz"
	"arch-makefile.patch")
sha512sums=('a374fb2c1ae42a695ae76433d5201cee1b31839fa0b7f8e4b72d5f89bad5f19d412ca69f8067d7a134e23945fca5a28911147782d00de048d080c9d7f3281dad'
	'SKIP')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	patch Makefile "${srcdir}/arch-makefile.patch"
	make all
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
