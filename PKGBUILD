# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=atem
pkgver=0.4.0
pkgrel=1
pkgdesc="A command-line tool to convert MetaStock (DataLink) binary data to ASCII text"
url="https://github.com/rudimeier/${pkgname}"
arch=("i686" "x86_64")
license=("BSD-3")
makedepends=("help2man")
options=(!emptydirs)
source=(https://bitbucket.org/rudimeier/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	autoreconf -vfi
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}" install

	# Directories
	install -d "${pkgdir}"/usr/share/licenses/${pkgname}

	# License
	ln -sf "/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha1sums=('df93f0ad837685ff7edad8b7be237d3a81454f13')
