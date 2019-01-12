# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
_pkgname=python-ngmix
pkgbase=python-ngmix-git
pkgname=("python-ngmix-git" "python2-ngmix-git")
pkgver=v1.2.r1.402f4f8
pkgrel=1
pkgdesc=" Gaussian mixture models and other code for working with for 2d images, implemented in python "
arch=('x86_64')
url="https://github.com/esheldon/ngmix"
license=('GPL')
makedepends=('git' 'python' 'python-numpy' 'python2' 'python2-numpy' 'python-numba' 'python2-numba' )
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
	nosetests -v 

	cd "$srcdir"/$_pkgname-py2
	nosetests2 -v || warning 'Tests failed'

}

package_python-ngmix-git() {
	  		   cd "${_pkgname}"
	  		   python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			   install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-ngmix-git() {			    
	 		    cd "${_pkgname}"
	 		    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

