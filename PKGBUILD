# Maintainer: Hendrikto <hendrik.to@gmail.com>

pkgname='bibclean'
pkgver='3.06'
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
	'6574f9b8042ba8fa05eae5416b3738a35c38d129f48e733e25878ecfbaaade43'
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
