# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=1.6.1
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libcaer' 'dv-processing' 'boost' 'openssl' 'opencv' 'gperftools' 'sdl2' 'lz4' 'zstd' 'fmt' 'aravis' 'ffmpeg')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/runtime/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('4611f9138db330795217a1564c12e68ba767a42ad83834f07f96b85b27539cb3')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DDVR_ENABLE_TCMALLOC=ON -DDVR_ENABLE_PROFILER=ON .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
