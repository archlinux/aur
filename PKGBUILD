# Maintainer: Brendan MacDonell <brendan@macdonell.net>
pkgname=mongo_fdw
pkgver=4.0.0
pkgrel=1
pkgdesc="PostgreSQL foreign data wrapper for MongoDB"
arch=('i686' 'x86_64')
url="https://github.com/EnterpriseDB/mongo_fdw"
license=('LGPL3')
depends=('mongo-c-driver>=1.2' 'postgresql')
makedepends=('json-c')
install=mongo_fdw.install
_relname="REL-${pkgver//\./_}"
source=("https://github.com/EnterpriseDB/${pkgname}/archive/${_relname}.tar.gz"
        'jsonc-compile.patch'
        'subobject-access.patch')
md5sums=('9705f9d0c9affefa4184fb66051b7c90'
         '5052ecc1a0f48a6c9ca6e4488817369b'
         '68a315f57525226505933f9d4ea7bad5')

prepare() {
	cd "${pkgname}-${_relname}"
        patch -p1 -i ../jsonc-compile.patch
        patch -p1 -i ../subobject-access.patch
}

build() {
	cd "${pkgname}-${_relname}"
	make -f Makefile.meta
}

package() {
	cd "${pkgname}-${_relname}"
	make DESTDIR="${pkgdir}" -f Makefile.meta install
}
