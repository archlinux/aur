pkgname=lcm
pkgver=1.5.0
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
sha512sums=('a19800c1ac79b7725f26fd1e2e5abedcfcbe1b197a8a48860dd50a7b3e3af658286fe7dd3a1e3c69920eccf2a73185c90bf1cd6cf0f05a405abfa9d8f33eae4c')


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
