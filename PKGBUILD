# Maintainer: Carey Metcalfe <carey at cmetcalfe dot ca>

_gitname='audiowaveform'
pkgname=audiowaveform-git
pkgver=1.0.12.r1.ge43eb2c
pkgrel=1
pkgdesc="Generate waveform data and render waveform images from audio files"
arch=('i686' 'x86_64')
url="https://github.com/bbc/audiowaveform"
license=('GPL3')
provides=('audiowaveform')
conflicts=('audiowaveform')
depends=('libmad' 'libsndfile' 'libid3tag' 'gd')
makedepends=('git' 'cmake' 'boost')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/-/.r/; s/-/./'
}

build() {
	cd "$_gitname"
	cmake -DENABLE_TESTS=0 -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_gitname"
	DESTDIR="$pkgdir" make install
}
