# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.1'
pkgrel='1'
arch=('i386' 'x86_64')
url='http://www.sile-typesetter.org/'
license='custom'
source=("https://github.com/simoncozens/sile/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c03ddcd80383e1b44a8aa35dff52950cb492adf8f78ec39ce00acf3f33ad3c56ffcfe82a8af5e6074d1d4a8a1d4b227c7de61843ecf83ca8e709558ff9935094')
depends=('lua'
         'lua-lpeg'
         'lua-expat'
         'libpng'
         'libpaper'
         'fontconfig'
         'freetype2'
         'pango'
         'harfbuzz')

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package () {
	cd "${pkgname}-${pkgver}"

	make install DESTDIR="${pkgdir}"

	# Documentation and examples
	for file in README.md ROADMAP documentation/sile.pdf ; do
		install -Dm644 "${file}" \
			"${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
	cp -ar examples "${pkgdir}/usr/share/doc/${pkgname}/"

	# License
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
