pkgname=rsgain-git
_pkgname=rsgain
pkgver=20220915.g9a58fc0db28a3e5b3a5e3fef3f9393920a9245df
pkgrel=1
pkgdesc="ReplayGain 2.0 loudness normalizer"
arch=('x86_64')
url="https://github.com/complexlogic/rsgain"
license=('custom')
groups=()
depends=('fmt' 'libebur128' 'taglib' 'libavformat.so' 'libavcodec.so' 'libswresample.so' 'libavutil.so' 'libinih')
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
 
