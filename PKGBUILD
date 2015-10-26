# Maintainer: wangjiezhe <wangjiezhe AT yandex AT com>

pkgname=librsb
pkgver=1.2.0_rc2
pkgrel=1
pkgdesc="A shared memory parallel sparse matrix library including Sparse BLAS."
arch=('any')
url="http://sourceforge.net/projects/librsb"
license=('LGPL3')
depends=()
makedepends=()
optdepends=()
options=()
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz"
        "http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz.asc")
md5sums=('839b51d0ab124522f735533a853bdb0f'
         'SKIP')
validpgpkeys=('1DBB555AEA359B8AAF0C6B88E0E669C8EF1258B8')

prepare() {
	cd "${pkgname}-${pkgver//_/-}"
	sed -i "s/CC -V/CC -v/g" configure aclocal.m4
	sed -i 's/{CC} -V/{CC} -v/g' configure configure.ac
}

build() {
	cd "${pkgname}-${pkgver//_/-}"
	./configure --prefix=/usr \
		CFLAGS='-fPIC -g -O2'
	make
}

check() {
	cd "${pkgname}-${pkgver//_/-}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver//_/-}"
	make DESTDIR="${pkgdir}/" install
}
