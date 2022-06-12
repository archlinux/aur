# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=bacnet-stack
pkgver=1.0.0
pkgrel=1
pkgdesc="BACnet protocol stack and diagnostic tools (bacrp, bacwp, etc.)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/bacnet/"
license=('GPL')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=()
makedepends=()
options=()
source=("https://sourceforge.net/projects/bacnet/files/bacnet-stack/bacnet-stack-${pkgver}/bacnet-stack-${pkgver}.tgz")
md5sums=('20cff7406566be1ab498f1bfeb68e1f9')
sha256sums=('2a73d0b6b687604fb3d001fbd97538665202ffd1b7913b76faddb061e714c115')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	# Parallel builds don't work in v1.0.0.  Appears to be fixed in git so the
	# next release should be ok.
	#make ${MAKEFLAGS}
	make -j1
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -d "$pkgdir/usr/bin"
	install -m 755 -t "$pkgdir/usr/bin" `find bin -executable -type f -name bac\*`
}
