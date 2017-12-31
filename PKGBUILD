# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
_pkgname=python-galsim
pkgname=('python-galsim-git' 'python2-galsim-git' )
pkgver=v1.5.1.r0.9de448ef9
pkgrel=1
pkgdesc=" The modular galaxy image simulation toolkit "
arch=('i686' 'x86_64')
url="https://github.com/GalSim-developers/GalSim.git"
license=('BSD')
makedepends=('git' 'scons' 'boost')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "${_pkgname}"
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

#check() {
#	cd "${_pkgname}"/tests
#	nosetests -v

#	cd "${_pkgname}"/tests
#	nosetests2 -v
#}

build() {
	cd "${_pkgname}"
	scons PREFIX=/usr TMV_DIR=/usr PYTHON=python
	scons PREFIX=/usr TMV_DIR=/usr PYTHON=python2
}
	
package_python-galsim-git() {
			    depends=('python' 'boost-libs' 'fftw' 'tmv-git')
			    cd "${_pkgname}"
			    scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr PYTHON=python install
			    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-galsim-git() {
			     depends=('python2' 'boost-libs' 'fftw' 'tmv-git')	
			     cd "${_pkgname}"
			     scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr PYTHON=python2 install
			     install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
