# Contributor: katt <magunasu.b97@gmail.com>

pkgname=libopenaptx-git
pkgver=0.2.1
pkgrel=1
pkgdesc='Open Source implementation of Audio Processing Technology codec (aptX)'
arch=(x86_64)
url='https://github.com/pali/libopenaptx'
license=(GPL3)
depends=(glibc)
makedepends=(git)
provides=(libopenaptx.so)
conflicts=(libopenaptx)
source=("$pkgver.tar.gz::https://github.com/pali/libopenaptx/archive/$pkgver.tar.gz")
sha512sums=('7c7f515585ed41cd276cd3141037ce21e3ebdb713dc932bcdb33320d9910c734bc81e581e2c09b3399b3516c789e5da7128fdab5ab6b5e4f42a86b6ac6d3f28c')

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags | sed 's/-/+/g'
}

build() {
	cd "${pkgname%-git}"
	make CPPFLAGS="$CPPFLAGS" \
	CFLAGS="-O3 -mavx2 $CFLAGS" \
	LDFLAGS="$LDFLAGS" \
    PREFIX=/usr "$@"
}

package() {
	cd "${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
