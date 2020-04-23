# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NFD
_pkgname=ndn-nfd
pkgname=$_pkgname
pkgver=0.7.0
pkgrel=4
# epoch=
pkgdesc="NFD is a network forwarder that implements and evolves together with the Named Data Networking (NDN) protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
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
source=(
  https://github.com/named-data/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz
  https://github.com/cawka/websocketpp/archive/0.8.1-hotfix.tar.gz
)
noextract=()
sha256sums=('dfe90e958b062b8beb90ebaa10d9a10c2165952c772aa03f170913666d602cce'
            'a5f692a4a8304eccfb6506941ceeb97990f0aecfcbe045d7fe8b24a46e0ef671')
validpgpkeys=()

prepare() {

  # Linking websocketpp library
  rmdir "${srcdir}/${_reponame}-${_reponame}-${pkgver}/websocketpp"
  ln -vs "${srcdir}/websocketpp-0.8.1-hotfix" "${srcdir}/${_reponame}-${_reponame}-${pkgver}/websocketpp"

  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"

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
