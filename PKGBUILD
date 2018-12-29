# Maintainer: Versus Void
pkgname=axtls
pkgver=2.1.4
pkgrel=1
pkgdesc="Highly configurable client/server TLSv1.2 library"
arch=(x86_64 i686)
url="http://axtls.sourceforge.net/"
license=('BSD')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/axTLS-${pkgver}.tar.gz"
	"config.h"
	".config"
	)
#noextract=()
sha256sums=("e53dd20e2b619349bc48b631176a38742ea600333fd0349df83c6366b7be05bb"
	"c432c84b21d67fdf8e7fe2807d2354335a5f9e38ce37c5df43157b9a9253b71c"
	"f6f8f3d744f34ba8b6e7bfeab46cee95f64fc6c6a8999834f710f0e599a781b3"
	)

prepare() {
	cd "axtls-code"
	cp "$srcdir/config.h" config/
	cp "$srcdir/.config" config/
	#sed -i '/rm $(PREFIX)\/include\/axTLS\/os_port.h/d' Makefile
}

build() {
	cd "axtls-code"
	make
}

package() {
	cd "axtls-code"
	mkdir -p "$pkgdir/usr"
	sed "s#PREFIX=.*#PREFIX=\"$pkgdir/usr\"#g" -i config/.config
	make install
}
