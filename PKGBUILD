# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NFD
pkgname=ndn-nfd
pkgver=0.6.6
pkgrel=1
# epoch=
pkgdesc="NFD is a network forwarder that implements and evolves together with the Named Data Networking (NDN) protocol"
arch=("any")
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=('valgrind: memory analysis')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(
  https://github.com/named-data/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz
  https://github.com/cawka/websocketpp/archive/0.8.1-hotfix.tar.gz
)
noextract=()
sha256sums=('ff57d96d479c6b8a3c8814c360428dbf82b09a7d1c1de57135116607a7e1cfbd'
            'a5f692a4a8304eccfb6506941ceeb97990f0aecfcbe045d7fe8b24a46e0ef671')
validpgpkeys=()

prepare() {
  rmdir "${srcdir}/${_reponame}-${_reponame}-${pkgver}/websocketpp"
  ln -vs "${srcdir}/websocketpp-0.8.1-hotfix" "${srcdir}/${_reponame}-${_reponame}-${pkgver}/websocketpp"
  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"	
  ./waf configure
}

build() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
	mv "${pkgdir}/usr/local/"* "${pkgdir}/usr"
}
