# Maintainer: Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>
pkgname=guile-dbd-postgresql
pkgver=2.1.6
pkgrel=1
pkgdesc='guile-dbi database driver postgresql'
arch=(i686 x86_64)
license=(GPL2)
depends=('guile-dbi>=2.1.2' postgresql-libs)
url=http://home.gna.org/guile-dbi/
source=(archlinux.patch
        http://download.gna.org/guile-dbi/${pkgname}-${pkgver}.tar.gz)
md5sums=('12e77b8ad0c512571a1be829c5e045e6'
         '93e6271b4b9ad9abac3fa16cd0b114ad')

build(){
 cd ${srcdir}
 patch -p0 < archlinux.patch
 cd ${srcdir}/${pkgname}-${pkgver}
 libtoolize
 aclocal
 autoscan
 autoheader
 automake
 autoconf
 ./configure --prefix=/usr || return 1
 make
}

package() {
 cd ${srcdir}/${pkgname}-${pkgver}
 make DESTDIR=${pkgdir} install
}
