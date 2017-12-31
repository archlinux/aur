# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  M. Jarvis
_pkgname=tmv
pkgname=${_pkgname}-git
pkgver=v0.75.r0.fab5df3
pkgrel=1
#epoch=
pkgdesc=" A fast, intuitive linear algebra library for C++ "
arch=('i686' 'x86_64')
url="https://github.com/rmjarvis/tmv/"
license=('BSD')
depends=('bash' 'cblas')
makedepends=('git')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')


pkgver() {
	 cd "${_pkgname}"
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
	cd "${_pkgname}"
	scons tests && tests/tmvtest1 && tests/tmvtest2 && tests/tmvtest3
}

build() {
	cd "${_pkgname}"
	scons PREFIX=/usr
}


package() {
	  cd "${_pkgname}"	
	  scons PREFIX=$pkgdir/usr FINAL_PREFIX=/usr install
	  install -Dm644 TMV_LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
