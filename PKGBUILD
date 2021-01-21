# gandalf3 <gandalf3@blendermonkey.com>

pkgname=swami
pkgver=2.2.1
pkgrel=1
pkgdesc='A SoundFont editor'
arch=('x86_64')
url='http://www.swamiproject.org'
license=('GPL2')
depends=('gtk2' 'fftw' 'audiofile' 'fluidsynth' 'libinstpatch' 'libgnomecanvas')
makedepends=('cmake')
optdepends=('libpng')
source=("https://github.com/swami/${pkgname}/archive/v${pkgver}.tar.gz" 'fix-2.2.x-for-gobject-property-system.patch')
sha1sums=('8c5444c16f2837f1e89bf2ff717171e0d9ebb13d'
          'd10ade9c2db31a7b771af1cd2178f2479615ddf4')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p 1 -i ../fix-2.2.x-for-gobject-property-system.patch
}

build() {
	cd "${pkgname}-${pkgver}"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
