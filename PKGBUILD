# Maintainer: BrainDamage
pkgname="libsixel"
pkgrel=1
pkgver="v1.8.5"
pkgdesc="libsixel provides and encoder/decoder implementation for DEC SIXEL graphics, and some converter programs"
arch=("i686" "x86_64")
url="https://saitoha.github.io/libsixel/"
license=("MIT")
depends=("libjpeg-turbo" "libpng" "python" "curl")
sha256sums=('682ef295eb93f262db7d77b3a5e8ffcb6e3f5a9fc864d1a21cc5cd3c347a4b0e')
source=("https://github.com/saitoha/libsixel/archive/${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver#v}"
	./configure --prefix=/usr --enable-python --enable-tests
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver#v}"
	make DESTDIR="${pkgdir}" install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/libsixel/LICENSE"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver#v}"
	make test
}
