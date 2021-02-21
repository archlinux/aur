# Maintainer: leuko <aur_et_aydos_de>
_pkgname=xpra-html5
pkgname=${_pkgname}-git
pkgver=r801.89552ae
pkgrel=1
pkgdesc="HTML5 client for Xpra"
arch=('x86_64')
url='https://www.xpra.org'
license=('MPL2')
conflicts=($_pkgname)
provides=($_pkgname)
makedepends=(
	git
	python-setuptools
	uglify-js  # for minifying HTML5
	gzip  # compression for served files (.gz)
	brotli  # compression for served files (.br)
)
source=("git+https://github.com/Xpra-org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install $pkgdir/usr/share/xpra/www
}
