# Maintainer: LinArcX <LinArcX at gmail dot com>

pkgname=tvdoon-git
pkgver=r3.69640c1
pkgrel=1
pkgdesc="Show Information About Tv Show's, Ratings And So Many Cool Fatures!"
arch=('any')
url="http://www.stack.blog.ir"
license=('GPL3')
depends=('python2-prettytable')
makedepends=('git' 'python2-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/LinArcX/tvdoon")
md5sums=('SKIP')

prepare(){
	cd "$pkgname-$pkgver"
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/tvdb_api-git.tar.gz
	tar tvdb_api-git.tar.gz
	cd tvdb_api-git
	makepkg
}

pkgver() {
	cd "$srcdir/${pkgname}"
		( set -o pipefail
			git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		)
}

#build(){
#	cd "${srcdir}/${pkgname}"
#	python setup.py build
#}

package() {
	# install -d ${pkgdir}/usr/share/tvdoon
	# cp -a ./sirfiliams.py  ${pkgdir}/usr/share/sirfiliams
	# cp -a ./setup.py ${pkgdir}
	# python setup.py install --root="$pkgdir/" --optimize=1
    
	cd "${srcdir}/${pkgname}"
	python2 setup.py install --prefix=/usr --root="$pkgdir"
	# sudo python setup.py install --optimize=1 --prefix=/usr/share/tvdoon
	# sudo python setup.py install --root="$pkgdir/" --optimize=1
	# make DESTDIR="$pkgdir/" install
}
