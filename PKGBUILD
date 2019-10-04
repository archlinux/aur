# Maintainer: Filippo Berto <berto.f@protonmail.com>
_pkgname=ndn-cxx
pkgname=${_pkgname}-git
pkgver=ndn.cxx.0.6.6.r0.g0d748af3
pkgrel=1
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=("any")
url="https://github.com/named-data/${_pkgname}"
license=('GPL')
groups=()
depends=('boost')
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

prepare() {
	cd "${srcdir}/${_pkgname}"
	git checkout `git describe --tags --abbrev=0`
	# Run the initial configuration
	./waf configure
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	# Build libraries and tools
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}"
	./waf install --destdir="${pkgdir}"
	
	mv "${pkgdir}/usr/local/"* "${pkgdir}/usr"
}
