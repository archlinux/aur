
_pkgname=mrwriter
pkgname="${_pkgname}-git"
pkgver=v0.0.6.r9.ge3edf62
pkgrel=1
pkgdesc="Notetaking and blackboard replacement application. Inspired by Xournal. Written in C++/Qt for Linux / Windows / Mac."
arch=('x86_64')
url="https://github.com/unruhschuh/MrWriter"
license=('GPL3')
depends=('qt5-base')
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
	qmake
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT="${pkgdir}/" install
	install -m644 -D "README.adoc" "${pkgdir}/usr/share/doc/${_pkgname}/README.adoc"
}
