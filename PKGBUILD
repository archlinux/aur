# Maintainer: fzerorubigd <fzero{AT}rubi{DOT}gd>
 
pkgname='jcal-git'
 
_gitname=${pkgname%-git}
#The real value will be calculated by pkgver() function
pkgver=0.5.1.r13.g3cb54e5
pkgrel=3
 
pkgdesc="Jalali calendar is a small and portable free software library to manipulate date and time in Jalali calendar system"
url="http://www.nongnu.org/jcal/"

arch=('any')
license=('GPL3')
provides=('jcal') 
depends=('readline')
makedepends=('git' 'automake')
source=('git+https://github.com/persiancal/jcal.git')
md5sums=('SKIP')
 
 
pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}
 
build() {
	cd "${srcdir}/${_gitname}/sources"
	/usr/bin/bash ./autogen.sh
	./configure --prefix=/usr
	make
}
 
package() {
	cd "${srcdir}/${_gitname}/sources"
	make DESTDIR=$pkgdir install
}
