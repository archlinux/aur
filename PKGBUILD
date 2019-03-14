# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: newville
_pkgname=python-lmfit
pkgbase=python-lmfit-git
pkgname=('python-lmfit-git' 'python2-lmfit-git')
pkgver=0.9.12.r73.24eecd1
pkgrel=1
pkgdesc="Non-Linear Least Squares Minimization, with flexible Parameter settings, based on scipy.optimize.leastsq, and with many additional classes and methods for curve fitting  "
arch=('i686' 'x86_64')
url="https://github.com/lmfit/lmfit-py.git"
license=('BSD')
makedepends=('git' 'python-numpy' 'python2-numpy' 'python-scipy' 'python2-scipy' 'python-asteval-git' 'python2-asteval-git' 'python-uncertainties' 'python2-uncertainties')
optdepends=('python2-pytest')
checkdepends=('python-nose' 'python2-nose' 'python-pytest' 'python-matplotlib' 'python2-matplotlib' 'ipython' 'ipython2' 'python-ipywidgets' 'python2-ipywidgets' 'python-pandas' 'python2-pandas' 'python-future' 'python2-future' )
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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

check() {
	cd "$srcdir"/$_pkgname
	#python setup.py test || warning 'Tests failed'
	nosetests -v || warning 'Tests failed'
	
	cd "$srcdir"/$_pkgname-py2
	#python2 setup.py test || warning 'Tests failed'
	nosetests2 -v || warning 'Tests2 failed'
}

package_python-lmfit-git() {
			      depends=('python-numpy' 'python-scipy' 'python-asteval-git' 'python2-uncertainties')
	  		      cd "${_pkgname}"
	  		      python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		      install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-lmfit-git() {
			       depends=('python2-numpy' 'python2-scipy' 'python2-asteval-git' python2-uncertainties)
			       cd "${_pkgname}"
	  		       python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		       install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}