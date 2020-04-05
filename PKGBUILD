# gandalf3 <gandalf3@blendermonkey.com>

pkgname=swami
pkgver=2.2.0
pkgrel=1
pkgdesc='A SoundFont editor'
arch=('x86_64')
url='http://www.swamiproject.org'
license=('GPL2')
depends=('gtk2' 'fftw' 'audiofile' 'fluidsynth' 'libinstpatch' 'libgnomecanvas')
makedepends=('cmake')
optdepends=('libpng')
source=("https://github.com/swami/${pkgname}/archive/v${pkgver}.tar.gz" 'cwd.patch')
sha1sums=('218685dec42d2db2dffa77a28633096d29458950'
          'c8f475348486f7664deb1d47afa90039d31529e8')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch src/swamigui/main.c < ../cwd.patch
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
