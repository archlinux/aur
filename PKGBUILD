# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=openaptx-git
_pkgname=openaptx
pkgver=r22.32f01e5
pkgrel=1
pkgdesc="reverse-engineered apt-X"
arch=('x86_64')
url="https://github.com/Arkq/openaptx"
license=('MIT')
depends=()
makedepends=('git')
provides=('openaptx')
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git://github.com/Arkq/openaptx.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/openaptx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/openaptx"
	libtoolize
	aclocal
	autoconf
	autoheader
	automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/openaptx"
	make DESTDIR="$pkgdir/" install
}
