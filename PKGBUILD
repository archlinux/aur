# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=0.9.2
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/$pkgname/"
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libcaer' 'boost' 'openssl' 'opencv' 'gperftools' 'sfml' 'libx11' 'lz4' 'zstd')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://gitlab.com/inivation/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('377b470c2d1c4c73384901e71b2dfd8298f3bf8ce08064481d5cd2f1338a0cce')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TCMALLOC=1 -DENABLE_VISUALIZER=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
