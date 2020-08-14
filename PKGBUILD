# Maintainer: Parker Reed <parker.l.reed@gmail.com>

pkgname=joycond-nicman23-git
pkgver=r80.371b5b4
pkgrel=1
pkgdesc='Userspace daemon to combine joy-cons from the hid-joycon kernel driver. Patched to not conflict with steam and auto-pair Pro controllers.'
arch=('any')
url='https://github.com/DanielOgorchock/joycond'
license=('GPL3')
makedepends=('cmake' 'git')
provides=("${pkgname%}")
conflicts=("${pkgname%}" joycond-git)
source=('git+https://github.com/nicman23/joycond.git')
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
