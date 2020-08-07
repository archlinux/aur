# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-tools
_pkgname=ndn-tools
pkgname=${_pkgname}-git
pkgver=ndn.tools.0.7.r15.g3527558
pkgrel=1
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
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_reponame}"
	git submodule update --init --recursive
	./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${_reponame}"
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
}
