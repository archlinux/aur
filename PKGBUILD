# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NFD
_pkgname=ndn-nfd
pkgname=${_pkgname}-git
pkgver=NFD.0.7.0.r21.gc68b2e8a
pkgrel=5
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
	git submodule update --init --recursive
	./waf configure --prefix=/usr --with-tests
}

build() {
	cd "${srcdir}/${_reponame}"
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
}
