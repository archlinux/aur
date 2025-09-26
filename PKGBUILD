# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com> 

_pkgname="vdens"
pkgname="$_pkgname-git"
pkgver=0.2.r9.bd3228a
pkgrel=1

pkgdesc="Create User Namespaces connected to VDE networks."
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2.0')
depends=('vdeplug4')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
install=vdens.install

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgname
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j $(nproc)
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}
