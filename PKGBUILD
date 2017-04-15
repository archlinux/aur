# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=mfoc-git
pkgver=103.9d9f01f
pkgrel=1
pkgdesc="Mifare Classic Offline Cracker"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc"
license=('GPL2')
depends=('libnfc>=1.7.0')
makedepends=('git')
conflicts=('mfoc')
source=("$pkgname"::'git://github.com/nfc-tools/mfoc.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vis
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
