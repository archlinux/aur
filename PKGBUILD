# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-cxx
_pkgname=ndn-cxx
pkgname=${_pkgname}-git
pkgver=0.7.0.r47.g483087f5
pkgrel=2
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'sqlite' 'openssl>=1.0.2')
makedepends=('git' 'python' 'doxygen' 'python-sphinx')
checkdepends=()
optdepends=('boost-stacktrace-backtrace')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${_reponame}"
  git describe --long | sed 's/^ndn.cxx.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_reponame}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}"
	./waf build
  ./waf docs
}

#check() {                                    
#  cd "${srcdir}/${_reponame}-${pkgver}"                          
#  ./waf install --destdir="${srcdir}/tests"   
#  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests   
#}    

package() {
	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
}
