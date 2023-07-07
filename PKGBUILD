pkgname=rsgain-git
_pkgname=rsgain
pkgver=3.3.r5.g8d2a7f1
pkgrel=1
pkgdesc="ReplayGain 2.0 loudness normalizer"
arch=('x86_64')
url="https://github.com/complexlogic/rsgain"
license=('custom')
groups=()
depends=('fmt' 'libebur128' 'taglib' 'ffmpeg' 'libinih')
makedepends=('git' 'cmake')
provides=('rsgain')
conflicts=('rsgain')
source=("git+https://github.com/complexlogic/rsgain.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
 
