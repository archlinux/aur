# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='myrddin'
pkgver='0.3.0'
pkgrel='1'
pkgdesc='Compiler and tools for the Myrddin programming language.'
arch=('i686' 'x86_64')
conflicts=('myrddin-git')
license=('MIT')
depends=('glibc')
url='https://myrlang.org/'
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('5840d097c8365ebac8af8661d1db253dd91a092c82300e559d83d57e75c51c941c72c8d537eb64e1cfbc1b0fa233db068486711c06af289061710ff4c0f3bef0')
install=myrddin.install

build() {
	cd mc
	./configure --prefix=/usr
	make
}

check () {
	make -C mc check
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
