# Maintainer: t3kk3n <corp [at] hush [dot] ai>

pkgname=fatx
pkgver=1.15
pkgrel=2
pkgdesc="XBox filesystem support for linux"
arch=('any')
url="http://sourceforge.net/projects/fatx/"
license=('GPL')
provides=($pkgname)
depends=('fuse' 'boost' 'boost-libs')
source=("http://downloads.sourceforge.net/project/fatx/${pkgname}-${pkgver}.tar.gz" "fatx.patch")
sha256sums=('bcdd90d37ff16c83ae5350273cf000064de698e2ddde3ba7aa1da3e6cfc4c455'
            'f7a9cf753c130654dd3d5de109b562dc2f9b188688d961f57023e29eb2f89470')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "../fatx.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CC=/usr/bin/gcc-6
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
