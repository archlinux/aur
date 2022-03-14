# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-processing
pkgver=1.3.0
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
sha256sums=('623ad426c1f8983672e99f0bbe02da2ba1c209766366b56209fe44d4f123656e')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TESTS=1 -DENABLE_BENCHMARKS=0 -DENABLE_SAMPLES=0 -DENABLE_PYTHON=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
