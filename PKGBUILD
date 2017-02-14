# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=gamera-git
pkgver=3.4.2.r42.g51a0c59bd547
pkgrel=1
pkgdesc="Framework for building document analysis applications."
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://gamera.informatik.hsnr.de"
license=('GPL')
depends=('python2' 'libtiff' 'libpng' 'wxpython' )
source=('git+https://github.com/hsnr-gamera/gamera.git')
sha512sums=('SKIP')

pkgver() {
	cd gamera
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd gamera 
	python2 setup.py build
}

package() {
	cd gamera
	python2 setup.py install --root=${pkgdir} --prefix=/usr
}
