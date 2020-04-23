# Maintainer: Filippo Berto <berto.f@protonmail.com>
_pkgname=ndn-tools
pkgname=${_pkgname}-git
pkgver=ndn.tools.0.7.r10.g8a2907e
pkgrel=2
# epoch=
pkgdesc="A collection of basic tools for Named Data Networking"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_pkgname}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
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
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
	./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${_pkgname}"
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}"
	./waf install --destdir="${pkgdir}"
}
