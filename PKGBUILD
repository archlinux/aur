# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=pstack
pkgver=2.18.9
pkgrel=1
pkgdesc='Print stack traces from running processes, or core files.'
arch=(x86_64)
url='https://github.com/peadar/pstack'
license=(BSD)
makedepends=(cmake python xz zlib)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('43ff7e9bc5a65b88cca42c34024e9a6b8739df933a222d9e567a2e17f93385172de24f0e373433ba2dd62d6993670f80d6b162f8e5e169372ebfdf4530735d3c')

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
