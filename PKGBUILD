# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

pkgname="python-pybars3-git"
pkgver=0.9.7.r1.g2edd2fa
pkgrel=1
pkgdesc="A general object-oriented pattern matcher for Python, based on Alessandro Warth's OMeta."

url="https://github.com/wbond/pybars3"
license=("LGLP3")
arch=("any")
provides=("python-pybars3")
depends=('python-pymeta3')
makedepends=("python-setuptools")

source=("$pkgname::git+https://github.com/wbond/pybars3.git")
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	# run tests
	cd "$pkgname"
	PYTHONPATH="$srcdir/$pkgname" python tests.py
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
