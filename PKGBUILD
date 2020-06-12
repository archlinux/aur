# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=lcm
pkgver=1.4.0
pkgrel=1
pkgdesc="Lightweight real-time networking library"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/lcm-proj/lcm"
license=('LGPL')
depends=('glib2')
optdepends=(
	'java-environment: support for lcm-spy and other GUI tools'
	'ttf-dejavu: support for lcm-spy and other GUI tools'
)
makedepends=(cmake)
source=(https://github.com/lcm-proj/lcm/releases/download/v$pkgver/$pkgname-$pkgver.zip)
sha512sums=('76ef0892cf7bc4cbda3c87776ebe9c095bae821efe19720461670031f88aff48f17551297b47c9bf8e0390a1ae0cf11240599be1bc235de96615c3e2866800fd')


build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p built
	cd built
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/built"
	# LCM 1.4.0 unit tests are incompatible with Python 3, so we have to skip
	# this step for now.
	#CTEST_OUTPUT_ON_FAILURE=1 make -k test
}

package() {
	cd "$srcdir/$pkgname-$pkgver/built"
	make DESTDIR="$pkgdir/" install
}
