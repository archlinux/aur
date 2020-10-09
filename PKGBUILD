# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>

pkgname=mfoc-hardnested-git
pkgver=143.326a6e6
pkgrel=1
pkgdesc="Mifare Classic Offline Cracker. Enhanced."
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc"
license=('GPL2')
depends=('libnfc>=1.7.0')
makedepends=('git' 'gcc9')
provides=('mfoc')
conflicts=('mfoc' 'mfoc-git')
source=("$pkgname"::'git://github.com/vk496/mfoc.git#branch=hardnested')
sha1sums=('SKIP')
options=(!ccache)

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vis
	./configure CC=gcc-9 CXX=g++-9 --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
