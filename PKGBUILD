# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-processing
pkgver=1.5.1
pkgrel=1
pkgdesc="Generic algorithms for event cameras."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('boost' 'opencv' 'eigen' 'libcaer' 'fmt' 'lz4' 'zstd' 'python' 'python-numpy')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/processing/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('13cffd17e761825c4a30997fa009fe381c088353028f683e24ae501439003295')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TESTS=1 -DENABLE_UTILITIES=1 -DENABLE_PYTHON=1 -DENABLE_BENCHMARKS=0 -DENABLE_SAMPLES=0 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
