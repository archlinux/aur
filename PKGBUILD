pkgname=lcm
pkgver=1.5.3
pkgrel=1
pkgdesc="Lightweight Communications and Marshalling"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/lcm-proj/lcm"
license=('LGPL')
depends=('glib2')
optdepends=(
	'java-environment: support for lcm-spy and other GUI tools'
	'ttf-dejavu: support for lcm-spy and other GUI tools'
)
makedepends=(cmake java-environment)
source=(https://github.com/lcm-proj/lcm/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(
f7e693d50e229e37de00387ac8ab9228e16559dd57bddd155c4b5ca1c233834e
)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p built
	cd built
	cmake -DLCM_ENABLE_JAVA=On -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/built"
	CTEST_OUTPUT_ON_FAILURE=1 make -k test
}

package() {
	cd "$srcdir/$pkgname-$pkgver/built"
	make DESTDIR="$pkgdir/" install
}
