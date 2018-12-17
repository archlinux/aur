pkgname="ntbtls-git"
_pkgname="ntbtls"
pkgver=0.1.2.r16.g4b7c6a9
pkgrel=1
arch=('x86_64')
url="https://www.gnupg.org/related_software/ntbtls/index.html"
license=('GPL3')
source=("$_pkgname::git+https://dev.gnupg.org/source/ntbtls.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/ntbtls.//'
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

