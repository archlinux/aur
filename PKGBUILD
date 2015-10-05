# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trojita-git
pkgver=5964.30c3dca
pkgrel=1
pkgdesc="A fast QT IMAP e-mail client"
arch=(i686 x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qtwebkit' 'kdepimlibs4')
conflicts=('trojita')
provides=('trojita')
makedepends=('git' 'cmake')

source=('git://anongit.kde.org/trojita.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/trojita"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/trojita"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/trojita"
	make install DESTDIR="$pkgdir"
}
