# Maintainer: Versus Void
pkgname=axtls
pkgver=2.1.5
pkgrel=1
pkgdesc="Highly configurable client/server TLSv1.2 library"
arch=(x86_64 i686)
url="http://axtls.sourceforge.net/"
license=('BSD')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/axTLS-${pkgver}.tar.gz"
	"config.h"
	".config"
	)
sha256sums=('cf00b07617bfbf903cbe60821b54dc000415fae737f1db84b7f8da69537a2910'
            'eadc5dfb340f36de0fac0ae3dd0d1d21460e8ffdbb236cf6da744d64b65c4079'
            'f6f8f3d744f34ba8b6e7bfeab46cee95f64fc6c6a8999834f710f0e599a781b3')

prepare() {
	cd "axtls-code"
	cp "$srcdir/config.h" config/
	cp "$srcdir/.config" config/
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
