# Maintainer: éclairevoyant
# Contributor: Adrián Pérez de Castro <aperez at igalia dot com>

_pkgname=torch7-paths
pkgname="$_pkgname-git"
pkgver=r45.4ebe222
pkgrel=1
pkgdesc='File name manipulation module for Torch7'
arch=('x86_64' 'i686')
_gitname=paths
url="https://github.com/torch/$_gitname"
license=('custom')
depends=('luajit')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_gitname
	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLUADIR=/usr/share/lua/5.1 \
		-DLIBDIR=/usr/lib/lua/5.1 \
		-DLUALIB=/usr/lib/libluajit-5.1.so \
		-DLUA_INCDIR=/usr/include/luajit-2.1 \
		-DLUA_LIBDIR=/usr/lib
	make
}

package() {
	cd $_gitname
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
