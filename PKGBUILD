# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Tim Jenness 
_pkgname=python-palpy
pkgname=${_pkgname}-git
pkgver=pypi.1.8.1.r0.a7ad770
pkgrel=1
pkgdesc=" PALpy is a python interface to the PAL positional astronomy library  "
arch=('i686' 'x86_64')
url="https://github.com/Starlink/palpy"
license=('GPL')
depends=('python')
makedepends=('git' )
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
	git submodule init
	git submodule update
	python setup.py build
}


package() {
	  cd "${_pkgname}"	
	  python setup.py install --root=${pkgdir} --prefix=/usr
	  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
