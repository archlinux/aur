# Maintainer: Adrián Pérez de Castro
pkgdesc='Extensible Shell derived from Plan9 rc'
pkgname=es
pkgver=0.9.2
pkgrel=1
arch=(x86_64)
url=http://wryun.github.io/es-shell/
depends=(readline termcap)
makedepends=(bison)
license=('custom:Public Domain')
install=es.install
source=("https://github.com/wryun/es-shell/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7d317e046f7211eb4ce3c79573a5f6809e9e5928f63b3c3a08fe07c27af5cf50f2ecd30f7406a787d8a228b263e18bbc35d9025f7b94223b5b2b7d2f32eb730e')

build () {
	CFLAGS="-Wno-unused-const-variable" ./configure --prefix=/usr --with-readline
	make
}

package () {
	make DESTDIR="$pkgdir" install

	# Documentation and examples.
	install -D -m644 README.md \
		"${pkgdir}/usr/share/licenses/${pkgname}/README.md"
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		doc/ERRATA doc/usenix-w93.ps doc/es-list.gz
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" \
		examples/*.*
	cp -r examples/friedman "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

check () {
	make trip
}
