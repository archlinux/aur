# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
# Contributor: Ihor Kalnytskyi <ikalnytskyi at github dot com>

_pkgname=termcolor
pkgname="${_pkgname}-git"
pkgver=v1.0.1.r22.ga79bf3c
pkgrel=1
epoch=
pkgdesc='Termcolor is a header-only C++ library for printing colored messages to the terminal. Written just for fun with a help of the Force.'
arch=('x86_64')
url='https://github.com/ikalnytskyi/termcolor'
license=('BSD')
groups=()
depends=()
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgname}::git+https://github.com/ikalnytskyi/termcolor.git")
noextract=()
validpgpkeys=()
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	mkdir -p build
	cd build
	cmake -G 'Unix Makefiles' -DCMAKE_INSTALL_PREFIX=/usr ".."
}

build() {
	cd "${_pkgname}/build"
	cmake --build .
}

# check() {
# 	cd "${pkgname}/build"
# 	./test_termcolor
# }

package() {
	cd "${_pkgname}"
	(cd build && make PREFIX=/usr DESTDIR="${pkgdir}/" install)
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README.rst "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
}
