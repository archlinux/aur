# Maintainer: James Smith <jslonescout AT icloud DOT com>
# Contributer: James Smith <jslonescout AT icloud DOT com>
pkgname=wmvolman
pkgver=2.0.1
pkgrel=1
pkgdesc="Dockapp to easily mount external disks with udisks2"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/raorn/wmvolman"
license=('GPL2')
depends=('udisks2' 'libdockapp')
makedepends=('glib2' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('625c2911fd296dd4ce021f7902e64162544d75bd948145fc015cca8546b728ad')

# Manually generate configure
build() {
	cd "$pkgname-$pkgver"
	aclocal
	autoheader
	automake --add-missing
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
