# Maintainer: Filippo Berto <berto.f@protonmail.com>
_pkgname=nlsr
pkgname=ndn-${_pkgname}-git
pkgver=0.5.3.r9.g5f408ae
pkgrel=1
# epoch=
pkgdesc="Named Data Link State Routing Protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_pkgname}"
license=('GPL')
groups=()
depends=('boost' 'ndn-nfd' 'ndn-chronosync')
makedepends=('git' 'gcc' 'python' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
provides=("ndn-${_pkgname}")
conflicts=("ndn-${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_pkgname}"
	./waf build
}

check() {
  cd "${srcdir}/${_pkgname}"
	./build/unit-tests
}

package() {
	cd "${srcdir}/${_pkgname}"
	./waf install --destdir="${pkgdir}"
}
