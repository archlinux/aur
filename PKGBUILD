# Maintainer: Thermionix

pkgname=modrana
pkgver=0.52.10
pkgrel=1
pkgdesc="ModRana is a flexible GPS navigation software for (not only) mobile Linux devices."
arch=('i686' 'x86_64')
url="http://modrana.org/"
license=('GPL3')
depends=('python2' 'pygtk')
source=("http://www.modrana.org/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.gz")

md5sums=('43d9cdff55c5852bc4990a51d57bf5da')

build() {
	cd "$pkgname-$pkgver"
	
	make
	make rsync
	make bytecode-python2
}

package() {
	cd "$pkgname-$pkgver/"
	make DESTDIR="$pkgdir/" install
	sed -i "s|/usr/bin/env python|/usr/bin/env python2|" "${pkgdir}"/usr/share/modrana/modrana.py
}
