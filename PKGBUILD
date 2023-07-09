# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=drumrox
pkgver=3.2.1
pkgrel=1
pkgdesc='Drumrox is LV2 drum machine that supports Hydrogen, Drumrox and SFZ drumkits.'
arch=('x86_64')
license=('GPL')
url='https://github.com/psemiletov/drumrox'
groups=('lv2-plugins' 'pro-audio')
depends=('libsndfile' 'libsamplerate' 'lv2')
makedepends=('gtk2' 'cmake')
#optdepends=('gtk2: For the built-in GUI')
provides=("drumrox")
source=("https://github.com/psemiletov/drumrox/archive/${pkgver}.tar.gz")
md5sums=('a3f160d2684fa9bbbb03f78ceb5b7c4d')

build() {
	cd "${srcdir}/drumrox-${pkgver}"
	mkdir -p build_dir
	cd build_dir
	cmake ../	\
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/drumrox-${pkgver}"
	cd build_dir
	make DESTDIR="${pkgdir}/" install
}
