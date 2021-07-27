
_pkgname=mrwriter
pkgname="${_pkgname}-git"
pkgver=v0.0.7.r2.g9b9ae09
pkgrel=2
pkgdesc="Notetaking and blackboard replacement application. Inspired by Xournal. Written in C++/Qt for Linux / Windows / Mac."
arch=('x86_64')
url="https://github.com/unruhschuh/MrWriter"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=("${_pkgname}::git+https://github.com/unruhschuh/MrWriter.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	cmake ..
	cmake --build .
}

package() {
	cd "$srcdir/${_pkgname}"
	install -m677 -D "build/bin/MrWriter" "${pkgdir}/usr/bin/${_pkgname}"
	install -m644 -D "README.adoc" "${pkgdir}/usr/share/doc/${_pkgname}/README.adoc"
}
