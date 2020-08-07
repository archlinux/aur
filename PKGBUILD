# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NLSR
_pkgname=ndn-nlsr
pkgname=$_pkgname
pkgver=0.5.2
pkgrel=2
# epoch=
pkgdesc="Named Data Link State Routing Protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost' 'ndn-psync')
makedepends=('git' 'python' 'boost' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=('valgrind: memory analysis'
            'doxygen: build documentation'
            'python-sphinx: build documentation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz)
noextract=()
sha256sums=('27d8672784c63f815ff519f807e94fbb66f1a8da3674fe907cea762f465d55de')
validpgpkeys=()

prepare() {
  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"

  # Patch missing includes
  sed -i '26i#include <ostream>' src/statistics.hpp

  ./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
