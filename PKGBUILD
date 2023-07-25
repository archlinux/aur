# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-processing
pkgver=1.7.9
pkgrel=1
pkgdesc="Generic algorithms for event cameras."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('boost' 'opencv' 'eigen' 'libcaer' 'fmt' 'lz4' 'zstd' 'openssl' 'libbacktrace-git' 'python' 'python-numpy')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/processing/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('ce1a8d384671fe8ae57d3ba264eb3eec6f2ce91ac0bb47545afd2f9ebe8e7454')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TESTS=1 -DENABLE_UTILITIES=1 -DENABLE_PYTHON=1 -DENABLE_BENCHMARKS=0 -DENABLE_SAMPLES=0 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
