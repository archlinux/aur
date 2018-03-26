# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Maintainer: Sean Greenslade <aur@seangreenslade.com>
pkgname=usbtop-git
pkgver=0.2
pkgrel=1
pkgdesc="top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
arch=('i686' 'x86_64')
url="https://github.com/aguinet/usbtop"
license=('BSD')
depends=('boost-libs' 'libpcap')
provides=('usbtop')
conflicts=('usbtop')
makedepends=('boost' 'cmake' 'git')
source=("git+https://github.com/aguinet/usbtop.git")
sha256sums=('SKIP')

pkgver() {
	cd usbtop
	git describe --tags | sed 's/release-//g' | sed 's/-/./g'
}

build() {
	cd usbtop
	cmake -DCMAKE_INSTALL_PREFIX="/usr" .
	make
}

package() {
	cd usbtop
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
