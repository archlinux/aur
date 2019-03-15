# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Dan Foreman-Mackey
_pkgname=python-corner
pkgbase=python-corner-git
pkgname=("python-corner-git" "python2-corner-git")
pkgver=v2.0.0.r35.g790e427
pkgrel=1
pkgdesc=" The Python ensemble sampling toolkit for affine-invariant MCMC  "
arch=('any')
url="https://github.com/dfm/corner.py.git"
license=('MIT')
makedepends=('git' 'python' 'python2' 'python-numpy' 'python2-numpy' 'python-matplotlib' 'python2-matplotlib' 'python-scipy' 'python2-scipy' 'python-pandas' 'python2-pandas')
checkdepends=('python-nose' 'python2-nose') 
optdepends=('python-pytest' 'python2-pytest')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "$srcdir"/$_pkgname
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}	

prepare() {
	  cp -a $_pkgname{,-py2}
}

build() {
	cd "$srcdir"/$_pkgname
	python setup.py build

	cd "$srcdir"/$_pkgname-py2
	python2 setup.py build
}

#check() {
#	cd "$srcdir"/$_pkgname/corner/tests
#	nosetests -v || warning 'Tests failed'
#
#	cd "$srcdir"/$_pkgname-py2/corner/tests
#	nosetests2 -v || warning 'Tests2 failed'
#}

package_python-corner-git() {
		       depends=('python-numpy' 'python-matplotlib' 'python-scipy' )
		       cd "${_pkgname}"
		       python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
		       install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-corner-git() {
			depends=('python2-numpy' 'python2-matplotlib' 'python2-scipy')			    
			cd "${_pkgname}"
			python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

}

