# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.5.3
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('242e6409e2c1af2b041699c8d047d61571b8d3f9a580ec2bb9120d107265180b4516dde2d523f3936652edb1d0e80d39203965f9eb89fb38c27862ba1ddcf4ad')

build() {
    cd $pkgname-$pkgver
    cmake -B build \
		  -DCMAKE_BUILD_TYPE=Release \
	  	-DCMAKE_INSTALL_PREFIX=/usr \
		  -DVERSION_TAG=$pkgver \
		  -DPYTHON2=OFF \
		  -DPYTHON3=OFF \
		  -Wno-dev
    cmake --build build
}

package() {
    cd $pkgname-$pkgver
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
