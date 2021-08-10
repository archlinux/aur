# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
pkgname=hurl
pkgver=0.5
pkgrel=1
pkgdesc='HTTP/HTTPS/Gopher file grabber'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/hurl.html'
_url_source='https://codemadness.org/releases/hurl'
license=('ISC')
depends=('libretls')
conflicts=('hurl-bin')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('92429a6c11689b1dfb2efe27faf5e3344cb4a00d78a365ee4fbbf10537a1077e')

build() {
	make CFLAGS="-DPOSIX_C_SOURCE=201112L -D_GNU_SOURCE" -C "${pkgname}-${pkgver}"
}

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' MANDIR='/usr/share/man' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
