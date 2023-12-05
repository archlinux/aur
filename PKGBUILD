# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.4.6
pkgrel=2
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('dc7a9f91305741ec0a73baf4f3e30fcd3498613d621710e4f7475746b49b68687db6259eb4331e6111c7494b87e6e9d68cfa75d4dd47d1f224a2f1efa2590bde')

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
