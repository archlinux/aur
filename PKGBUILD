# Maintainer: Peter Semiletov peter.semiletov at gmail dot com

pkgname=drumrox
pkgver=3.3.0
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
md5sums=('e01ead2f5366bfa086272b83a20beb30')

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
