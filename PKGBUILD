# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=fxt
pkgdesc='Fast kernel/user tracing library'
url='https://savannah.nongnu.org/p/fkt'
pkgver=0.3.13
pkgrel=1
arch=(x86_64 x86_64_v3)
license=('LGPL3')
depends=('blas')
makedepends=('help2man')
source=(
    "fxt-$pkgver.tar.gz::https://download.savannah.nongnu.org/releases/fkt/fxt-$pkgver.tar.gz"
    "fxt-$pkgver.tar.gz.sig::https://download.savannah.nongnu.org/releases/fkt/fxt-$pkgver.tar.gz.sig"
    'fxt.diff'
)
sha256sums=('1ad925b3df678c47321524ca5f2f811cdd3edcb19706b7e2a07c394c63e62eff'
            'SKIP'
            'SKIP')
validpgpkeys=('900cb024b67931d40f82304bd0178c767d069ee6')

prepare() {
	cd "${pkgname}-${pkgver}"
    patch -p1 -i../fxt.diff
}

build() {
	cd "${pkgname}-${pkgver}"
    autoreconf
    ./configure \
        --prefix=/usr \
        --enable-shared \
        --with-gnu-ld \
        --with-pic
    make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install -j1
}
