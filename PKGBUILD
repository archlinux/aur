# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-cxx
_pkgname=ndn-cxx
pkgname=${_pkgname}-git
pkgver=ndn.cxx.0.7.0.r47.g483087f5
pkgrel=3
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost')
makedepends=('git' 'python' 'sqlite' 'openssl>=1.0.2')
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
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_reponame}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}"
	./waf build
}

#check() {
#  2>&1 echo "Tests can be skipped with the --nocheck argument in makepkg"
#  cd "${srcdir}/${_reponame}"
#  ./build/unit-tests
#}

package() {
	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
}
