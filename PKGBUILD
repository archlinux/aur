# Maintainer: Diogo Leal <estranho@diogoleal.com>
# Contributor: Romain "Artefact2" Dalmaso <artefact2@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
pkgname=apachetop
pkgver=0.12.6
pkgrel=3
pkgdesc="Apachetop is a curses-based top-like display for Apache information, including requests per second, bytes per second, most popular URLs, etc."
arch=('x86_64' 'i686')
url="http://mirrors.zoelife4u.org/apachetop/"
license=('BSD')
depends=('ncurses') 
makedepends=() 
source=(http://mirrors.zoelife4u.org/${pkgname}/${pkgname}-${pkgver}.tar.gz apachetop-0.12.6-maxpathlen.patch)
md5sums=('604283ac4bbbddd98fc9b1f11381657e'
    'f7a108df8f65cdf2cb66a2b8c6b53174')

build() {
	cd "${pkgname}-${pkgver}"
	patch -p1 < "$startdir/apachetop-0.12.6-maxpathlen.patch"
	./configure --prefix=/usr --with-logfile=/var/log/httpd/access_log  || return 1

}
package(){
	cd "${pkgname}-${pkgver}"
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
