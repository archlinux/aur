# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=myrddin
pkgver=0.3.1
pkgrel=1
pkgdesc='Compiler and tools for the Myrddin programming language.'
arch=(i686 x86_64)
conflicts=('myrddin-git')
license=('MIT')
depends=('glibc')
url='https://myrlang.org/'
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('99f8d933572b2e3750103c1d801a29575971242c347c7fb042a5114d2cf3fe7cca2b927190ba13728b46573e00f414015cc0ef04bca8db3c67427261600ddd95')

build() {
	cd mc
	./configure --prefix=/usr
	make bootstrap
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
		install -t "${pkgdir}/usr/share/vim/vimfiles/${dir}" -Dm644 "${dir}"/*.vim
	done
}
