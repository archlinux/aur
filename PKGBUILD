pkgname=rsgain-git
_pkgname=rsgain
pkgver=20220709.g1c63a566d60cbf8d1614b3f8aa5c5a00e680ea30
pkgrel=1
pkgdesc="ReplayGain 2.0 loudness normalizer"
arch=('x86_64')
url="https://github.com/complexlogic/rsgain"
license=('BSD')
groups=()
depends=('libebur128' 'taglib' 'libavformat.so' 'libavcodec.so' 'libswresample.so' 'libavutil.so' 'libinih')
makedepends=('git' 'cmake')
provides=('rsgain')
conflicts=('rsgain')
source=("git+https://github.com/complexlogic/rsgain.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  date +"%Y%m%d"."g$(git rev-parse HEAD)"
}

build() {
	cd "$_pkgname"
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}
 
