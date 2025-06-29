pkgname=lcm
pkgver=1.5.1
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
sha512sums=(
c3772d8fae308755af86197e491014e61c947d6befef0641b34735728e478be946b7e2f0012c548caad3570f4a49821a6033e22e2a39c3219b3b7fd1746ab77b
)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p built
	cd built
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
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
