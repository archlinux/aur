# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=1.5.3
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libcaer' 'dv-processing' 'boost' 'openssl' 'opencv' 'gperftools' 'sfml' 'libx11' 'lz4' 'zstd' 'fmt' 'aravis' 'ffmpeg')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/runtime/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('cc02c637e97140980e485af194a2e49fae5c10bb0f44ec4d98f343b8c42b1f1b')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TCMALLOC=1 -DENABLE_VISUALIZER=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
