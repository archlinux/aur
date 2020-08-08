# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-traffic-generator
_pkgname=ndn-traffic-generator
pkgname=${_pkgname}-git
pkgver=r50.7393cb4
pkgrel=4
# epoch=
pkgdesc="This tool is designed to generate Interest and Data traffic in an NDN network"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'python')
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
