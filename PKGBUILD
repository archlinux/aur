# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
_pkgname=python-ngmix
pkgbase=python-ngmix
pkgname=("python-ngmix" "python2-ngmix")
pkgver=v0.9.4.r0.28e501c
pkgrel=1
pkgdesc=" Gaussian mixture models and other code for working with for 2d images, implemented in python "
arch=('any')
url="https://github.com/esheldon/ngmix"
license=('GPL')
checkdepends=('make')
makedepends=('git' 'python' 'python-numpy' 'python2' 'python2-numpy'  )
source=("${_pkgname}::git+${url}#tag=v0.9.4")
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
	cd "$srcdir"/$_pkgname/test
	make test/test-gmix test/test-gmix-model test/test-fastexp test/test-fastexp-speed test/test-image test/test-shape
	./test/test-gmix
	./test/test-gmix-model
	./test/test-fastexp
	./test/test-fastexp-speed
	./test/test-image
	./test/test-shape
}

package_python-ngmix() {
		       depends=('python-numpy')
		       cd "${_pkgname}"
		       python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python2-ngmix() {
			depends=('python2-numpy')			    
			cd "${_pkgname}"
			python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1

}
