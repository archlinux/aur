# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=1.7.2
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('dv-processing' 'boost' 'openssl' 'opencv' 'gperftools' 'sdl2' 'lz4' 'zstd' 'fmt' 'aravis' 'ffmpeg')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/runtime/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('b9f7fe730e5faa51f635a4bdcbed369a3d3d4739da10e66e78ba30932e062539')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DDVR_ENABLE_TCMALLOC=ON -DDVR_ENABLE_PROFILER=ON .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
