# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Erhad Husovic <xdaemonx@protonmail.ch>

pkgname=bim
pkgver=3.1.0
pkgrel=1
pkgdesc='Inspired by Vim, originally written for ToaruOS'
arch=(x86_64)
depends=('kuroko>=1.3.0')
license=(custom:ISC)
url=https://github.com/klange/bim
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('5e2c22efeefcb83e14f2211921c8bcd78f9193fc37d4e98194b07ccce02afaf3dd4f3eb2122cb4cbb48f94ade3e282c125866be528f9444e4a6c1c07285ede4a')

build() {
	cd "${pkgname}-${pkgver}"
	make prefix='/usr' LDLIBS='-lkuroko' LDFLAGS="${LDFLAGS} -rdynamic"
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix='/usr' DESTDIR="${pkgdir}" install

	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" docs/bim.1
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		README.md docs/*.md docs/example.bim3rc
}
