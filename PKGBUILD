# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=mfoc-hardnested-git
pkgver=137.ec3ca1c
pkgrel=1
pkgdesc="Mifare Classic Offline Cracker"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc"
license=('GPL2')
depends=('libnfc>=1.7.0')
makedepends=('git')
provides=('mfoc')
conflicts=('mfoc' 'mfoc-git')
source=("$pkgname"::'git://github.com/vk496/mfoc.git#branch=hardnested')
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
