# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=pdflib-lite
_pkgnamecaps=PDFlib-Lite
pkgver=7.0.5p3
_basepkgver=${pkgver/p*/}
pkgrel=4
pkgdesc="PDF manipulation library."
url="https://www.pdflib.com"
arch=('i686' 'x86_64')
depends=('glibc')
provides=('pdflib')
source=(http://ponce.cc/slackware/sources/repo/${_pkgnamecaps}-${pkgver}.tar.gz LICENSE.pdf)
license=(custom:pdflib-lite)

build() {
	cd "$srcdir"/$_pkgnamecaps-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$_pkgnamecaps-$pkgver
	make prefix="$pkgdir"/usr install

	## Copy files required by the license
	# Documentation
	mkdir -p "$pkgdir"/usr/share/pdflib-lite/doc
	cp ./doc/pdflib/* "$pkgdir"/usr/share/pdflib-lite/doc

	# License
	mkdir -p "$pkgdir"/usr/share/licenses/pdflib-lite
	cp -H ../LICENSE.pdf "$pkgdir"/usr/share/licenses/pdflib-lite/LICENSE.pdf

	# Examples
	make -C ./bind/pdflib clean
	cp -R ./bind/pdflib/{c,cpp,java} "$pkgdir"/usr/share/pdflib-lite
	find "$pkgdir"/usr/share/pdflib-lite \( \
		-name Makefile \
		-o -name *.dsp \
		-o -name *.dsw \
		-o -name *.sln \
		-o -name *.vcproj \
		\) -exec rm {} \;
}

sha512sums=('c33c330f22a9be7dc9a7a32f6fcabec37fe89c76105d4b870e94a0528c4de7885dcdeae775424e30aef9618d49f01d802dbece6f01451493a531bb2effb3f556'
            'a1d2324cca423a8dd95cb95772ef9600dbb65951d0fef90b79205c6303067dd7024c8c41936bf6e72258fcdcb747370f56912ae4c606c0d082d86be2f2b9d545')
