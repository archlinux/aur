# Contributor: Matthew Bauer <mjbauer95@gmail.com>

_pkgname=idevicerestore
pkgname=$_pkgname-git
pkgver=107.fde8082
pkgrel=1
pkgdesc="Restores firmware and filesystem to iPhone/iPod Touch"
arch=('i686' 'x86_64')
url="http://github.com/posixninja/$_pkgname"
license=('custom')
depends=('usbmuxd' 'libirecovery-git' 'libimobiledevice>=1.1.0')
makedepends=('git')
source=(git://github.com/posixninja/$_pkgname.git)
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_pkgname"

	#sed -i -e 's/\/usr\/local\//\/usr\//g' src/Makefile.am
	./autogen.sh --prefix=/usr
	make libirecovery_CFLAGS="-I/usr/include" libirecovery_LIBS="-L/usr/lib -lirecovery -lusb-1.0"
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR=$pkgdir install
}
