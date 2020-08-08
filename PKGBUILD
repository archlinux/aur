# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-cxx
_pkgname=ndn-cxx
pkgname=${_pkgname}
pkgver=0.7.0
pkgrel=7
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
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz)
noextract=()
sha256sums=('0efa2e7828bd8751ea2fb1aed0c83359410e7f76390c4fec905a6f4dea8a1b70')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf build
  ./waf docs
}

#check() {
#  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
#  ./waf install --destdir="${srcdir}/tests"
#  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests
#}

package() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
