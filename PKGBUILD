# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=mfoc-git
pkgver=0.10.7.r38.gba072f1
pkgrel=1
pkgdesc="Mifare Classic Offline Cracker"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc"
license=('GPL2')
depends=('libnfc>=1.7.0')
makedepends=('git')
conflicts=('mfoc')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')


pkgver() {
	cd "${pkgname}"
	git describe --tags | sed 's/^mfoc-//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd "${pkgname}"
	autoreconf -vis
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install
}
