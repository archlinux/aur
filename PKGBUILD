# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=python-js8py-git
pkgver=0.1.2.r5.g391347d
pkgrel=1
pkgdesc="python module for parsing messages from the "js8" command line decoder"
arch=('x86_64')
url="https://github.com/jketterl/js8py"
license=('GPL3')
makedepends=('git' 'python-setuptools' 'python-nose')
depends=('python')
provides=('js8py')
source=("$pkgname"::'git+https://github.com/jketterl/js8py')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

check(){
	cd "$srcdir/$pkgname"
	nosetests
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
