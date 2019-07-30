# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-runtime
pkgver=0.9.0
pkgrel=1
pkgdesc="C++ event-based processing framework for neuromorphic cameras, targeting embedded and desktop systems."
url="https://gitlab.com/inivation/$pkgname/"
license=('LGPL2')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libcaer' 'boost' 'openssl' 'opencv' 'gperftools' 'sfml' 'libx11')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://gitlab.com/inivation/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('f832f05152d5435d523488194850f858c15283893e3f3071f6bca1ccf6f5ae10')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TCMALLOC=1 -DENABLE_VISUALIZER=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
