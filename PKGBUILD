# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgname='myrddin'
pkgver='0.1.1'
pkgrel='1'
pkgdesc='Compiler and tools for the Myrddin programming language.'
arch=('i686' 'x86_64')
conflicts=('myrddin-git')
license=('MIT')
depends=('glibc')
url='https://myrlang.org/'
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('e838e79942e21512acf293e4efac015c1b0481598f381a123288fbc721b11905fe27ea98a4a3e21d0fe4f4ed35f2a445f0107d41197ba1cde67ee6ca30e374a0')
install=myrddin.install

build() {
	cd mc
	./configure --prefix="/usr"
	make
}

package() {
	cd mc
	make DESTDIR="$pkgdir" install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd support/vim/
	for dir in *; do
		install -t "${pkgdir}/usr/share/${pkgname}/vim/${dir}" -Dm644 "${dir}"/*.vim
	done
}
