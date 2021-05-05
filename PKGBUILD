# Maintainer: Parker Reed <parker.l.reed@gmail.com>

pkgname=joycond-git
pkgver=r102.2d3f553
pkgrel=1
pkgdesc='Userspace daemon to combine joy-cons from the hid-joycon kernel driver'
arch=('x86_64' 'aarch64')
url='https://github.com/DanielOgorchock/joycond'
license=('GPL3')
depends=('libevdev')
makedepends=('cmake' 'git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install=$pkgname.install
source=('git+https://github.com/DanielOgorchock/joycond.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/joycond"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/joycond"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/joycond"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/lib" "$pkgdir/usr/"
}
