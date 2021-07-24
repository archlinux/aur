# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=fatx
pkgver=1.15
pkgrel=3
pkgdesc="XBox filesystem support for linux"
arch=('any')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
depends=('fuse' 'boost' 'boost-libs')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}-${pkgver}.tar.gz" "fatx.patch")
sha256sums=('bcdd90d37ff16c83ae5350273cf000064de698e2ddde3ba7aa1da3e6cfc4c455'
            'a03197b4639cc019aca9e8cf784e2a41b0bd2d6a8e7bce1f624c079dd877f429')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "../fatx.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
