# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
_pkgname=python-galsim
pkgname=${_pkgname}-git
pkgver=v1.5.1.r0.9de448ef9
pkgrel=1
pkgdesc=" The modular galaxy image simulation toolkit "
arch=('i686' 'x86_64')
url="https://github.com/GalSim-developers/GalSim.git"
license=('BSD')
depends=('python' 'boost-libs' 'fftw' 'tmv-git')
makedepends=('git' 'scons' )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "${_pkgname}"
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${_pkgname}"
	scons PREFIX=/usr TMV_DIR=/usr PYTHON=python
}

package() {
	  cd "${_pkgname}"
	  scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr install
	  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
