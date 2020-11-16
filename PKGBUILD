# Maintainer: leuko <aur@aydos.de>
pkgname=xidel-git
pkgver=r575.d56b00b
pkgrel=1
pkgdesc="XQuery/XPath/CSS/JSONiq engine and webscraper"
arch=('x86_64')
url="http://www.videlibri.de/xidel.html"
license=('GPL')
makedepends=('git' 'subversion' 'fpc')
source=(
	'git+https://github.com/benibela/xidel.git'
	'git+https://github.com/benibela/flre.git'
	'synapse::svn+http://svn.code.sf.net/p/synalist/code/synapse/40'
	'git+https://github.com/benibela/rcmdline.git'
	'git+https://github.com/benibela/internettools.git'
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
conflicts=('xidel')
provides=('xidel')

pkgver() {
	cd xidel
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/xidel
	mkdir import
	mv $srcdir/flre import
	mv $srcdir/synapse import
	mv $srcdir/internettools .
	mv $srcdir/rcmdline .
}

build() {
	cd xidel
	./build.sh
}

package() {
	cd $srcdir/xidel
	install -D xidel $pkgdir/usr/bin/xidel
}
