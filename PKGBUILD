# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Flexible terminal-based text editor'
pkgname=mle
pkgver=1.8.1
pkgrel=2
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
conflicts=(mle-git)
depends=(pcre2 lua54)
makedepends=(uthash)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('7248ab752fc5eeff9df09bedb79958123593798f7ba64f7615f481270f3d27f1de563587ae716849ba0e86e7937eb8a7fc9fecde0f104db1360141ba9e25afd9')

build () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr
}

check () {
	cd "${pkgname}-${pkgver}"
	make test
}

package () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 mle.1 "${pkgdir}/usr/share/man/man1/mle.1"
}
