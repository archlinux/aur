# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=1.4.0
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libcaer' 'boost' 'openssl' 'opencv' 'gperftools' 'sfml' 'libx11' 'lz4' 'zstd' 'fmt' 'aravis' 'ffmpeg')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://gitlab.com/inivation/dv/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('b49b2b8ea14719f6a2f74a0ceeea9a5f7751944cefe35236dc967c066e3d1c6d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TCMALLOC=1 -DENABLE_VISUALIZER=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install

	cd "$pkgdir"

	# Fix systemd directory due to symlinks
	mv lib/systemd/ usr/lib/
	rm -Rf lib/
}
