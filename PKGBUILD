# Maintainer: Jonathon Fernyhough <jonathon_at manjaro_org>

pkgname=lily
pkgver=1.4
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="http://lily-lang.org/"
license=('MIT')
depends=('glibc')
makedepends=('cmake>=3.0.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fascinatedbox/lily/archive/v${pkgver}.tar.gz")
sha256sums=('c67e12da54451f8bc0d91d2e05b56fb3d0ca339edab3555d1d7a3e064ad0c3f1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./pre-commit-tests
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
	install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
