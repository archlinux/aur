# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=PSync
_pkgname=ndn-psync
pkgname=${_pkgname}-git
pkgver=0.2.0.r8.g042dfb3
pkgrel=4
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx')
makedepends=('git' 'gcc' 'python' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
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

check() {
  cd "${srcdir}/${_reponame}"
  ./build/unit-tests
}

package() {
	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
}
