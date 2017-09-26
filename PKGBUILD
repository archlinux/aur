# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='myrddin'
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Compiler and tools for the Myrddin programming language.'
arch=('i686' 'x86_64')
conflicts=('myrddin-git')
license=('MIT')
depends=('glibc')
url='https://myrlang.org/'
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('ff06f0981c8cf6c1acb4ed66d4fe02dbfeb1334278784e1b219ac60a24adcb5c7761281be155af0c7c26bd27f25532d346ddf79ee86928b14d593e529f4f7ecb')
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
