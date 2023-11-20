# Maintainer: Hendrikto <hendrik.to@gmail.com>

pkgname='bibclean'
pkgver='3.07'
pkgrel=1
pkgdesc='BibTeX and Scribe bibliography prettyprinter and syntax checker'
arch=('any')
url='https://ftp.math.utah.edu/pub/bibclean/'
license=('GPL') # version 2 or later
source=(
	"https://ftp.math.utah.edu/pub/${pkgname}/${pkgname}-${pkgver}.tar.xz"
	'mandir.patch'
)
sha256sums=(
	'919336782e9e3c204e60f56485fd1f8dd679eb622fc8fd1f4833595ee10191a6'
	'a31e1f8f9c627e80b4912148743d2d3caaadefac87ed3ac0468b91bc45359cc9'
)

prepare() {
	cd "${pkgname}-${pkgver}"

	patch -p1 --input="${srcdir}/mandir.patch"
}

build() {
	cd "${pkgname}-${pkgver}"

	./configure --mandir='/usr/share/man' --prefix='/usr'
	make bibclean
}

check() {
	cd "${pkgname}-${pkgver}"

	make check
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" prefix='/usr' install-{bibclean,man}

	# remove duplicates (e.g. bibclean-$pkgver)
	rm $(find "${pkgdir}" -name "*-${pkgver}*")
}

# former Maintainer: Gil Forsyth <gilforsyth@gmail.com>
