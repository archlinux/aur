# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=ptex
pkgver=2.3.0
pkgrel=2
pkgdesc="Per-Face Texture Mapping for Production Rendering"
arch=(x86_64)
url="http://ptex.us/"
license=('BSD')
depends=(zlib)
makedepends=(git doxygen cmake)
source=("https://github.com/wdas/ptex/archive/v${pkgver}.tar.gz")
sha512sums=('2d9d320e4205236a4eff05ec3c67d085624809ebefa89fa3b943d18a8b2b6a5f61c022a4cc4363a7c6ceccfb9eac4f8738dff2e90a3355814f2c4ff096c09992')

build() {
	cd "$pkgname-$pkgver"

    mkdir -p build && cd build
	cmake .. \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

check() {
	cd "$pkgname-$pkgver/build"
        make test V=1
}

package() {
	cd "$pkgname-$pkgver"/build

    # install -d ${pkgdir}/usr/share
    make DESTDIR="$pkgdir" install

    # cp -r install/{bin,include,lib} ${pkgdir}/usr
    # cp -r install/doc ${pkgdir}/usr/share/

    install -Dm644 ../src/doc/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/License.txt
}
