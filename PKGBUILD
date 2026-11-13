# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-processing
pkgver=2.1.1
pkgrel=1
pkgdesc="Generic algorithms for event cameras."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('boost' 'opencv' 'eigen' 'libusb' 'fmt' 'lz4' 'zstd' 'openssl' 'libbacktrace-git' 'python' 'python-numpy')
makedepends=('cmake' 'pkgconf' 'python-jinja')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/processing/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('45358f34a470000100577e3aa2dddeb14c0e661df33b32c84ca093f62bf9772e')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DDVP_ENABLE_TESTS=ON -DDVP_ENABLE_SAMPLES=OFF -DDVP_ENABLE_UTILITIES=ON -DDVP_ENABLE_BENCHMARKS=OFF -DDVP_ENABLE_PYTHON=ON -DDVP_UDEV_INSTALL=ON .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
