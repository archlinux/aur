# Maintainer: Chavdar Dutsov <ch.dutsov@phys.uni-sofia.bg>
# Contributor: TEOS-10
_pkgname=GSW-Python
pkgbase=python-gsw-git
pkgname=('python-gsw-git')
pkgver=v3.3.1.r0.1b2ccab
pkgrel=1
pkgdesc="Python implementation of TEOS-10 GSW based on ufunc wrappers of GSW-C "
arch=('i686' 'x86_64')
url="https://github.com/TEOS-10/GSW-Python.git"
license=('custom')
makedepends=('git' 'python-numpy' 'python-setuptools')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir"/$_pkgname
	python setup.py build
}

check() {
	cd "$srcdir"/$_pkgname
	python setup.py test || warning 'Tests failed'
	#nosetests -v || warning 'Tests failed'
}

package_python-gsw-git() {
			      depends=('python-numpy' )
	  		      cd "${_pkgname}"
	  		      python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		      install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
