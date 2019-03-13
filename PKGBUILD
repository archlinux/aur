# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
_pkgname=python-ngmix
pkgbase=python-ngmix-git
pkgname=("python-ngmix-git" "python2-ngmix-git")
pkgver=v1.2.1.r2.dba6286
pkgrel=1
pkgdesc=" Gaussian mixture models and other code for working with for 2d images, implemented in python "
arch=('i686' 'x86_64')
url="https://github.com/esheldon/ngmix.git"
license=('GPL')
makedepends=('git' 'python' 'python2' 'python-numpy' 'python2-numpy' 'python-numba' 'python2-numba' )
optdepends=('python-scipy' 'python2-scipy' 'python-galsim-git' 'python2-galsim-git' 'python-scikit-learn' 'python2-scikit-learn' 'python-statsmodels' 'python2-statsmodels' 'python-emcee-git' 'python2-emcee-git')
checkdepends=('python-nose' 'python2-nose' 'python2-galsim-git' 'python-galsim-git' 'python2-singledispatch')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$_pkgname-py2
	nosetests2 -v || warning 'Tests2 failed'

}

package_python-ngmix-git() {
			   depends=('python-numpy' 'python-numba')
	  		   cd "${_pkgname}"
	  		   python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			   install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-ngmix-git() {
			    depends=('python2-numpy' 'python2-numba')
	 		    cd "${_pkgname}"
	 		    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

