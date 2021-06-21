# Maintainer: Kicker0429 <kicker0429@yahoo.com>
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
_commit=811bc18586d634042618d633727ac0281d4170b8  # tags/0.2.1
source=("git+$url#commit=$_commit")
sha512sums=('SKIP')

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
