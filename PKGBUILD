# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=atem
pkgver=0.3.5
pkgrel=1
pkgdesc="A command-line tool to convert MetaStock (DataLink) binary data to ASCII text"
arch=("i686" "x86_64")
url="http://freecode.com/projects/${pkgname}"
license=("BSD-3")
makedepends=("help2man")
options=(!emptydirs)
source=(https://bitbucket.org/rudimeier/${pkgname}/downloads/${pkgname}-0.3.5.tar.gz)

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

sha1sums=('0d20551e400e45589785055edb2efc63a1d35a8c')
