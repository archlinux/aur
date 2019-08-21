# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=0.9.4
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
sha256sums=('3a2f28265a25a8e445a89268d316f1b09d486282cd9fd13be9f22e6f8d764813')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TCMALLOC=1 -DENABLE_VISUALIZER=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
