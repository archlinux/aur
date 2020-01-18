# Maintainer: Andrea Girotto <andrea (dot) girotto (at) gmail (dot) com>
pkgname=guile-dbd-postgresql
pkgver=2.1.6
pkgrel=3
pkgdesc='guile-dbi database driver postgresql'
arch=(i686 x86_64)
license=(GPL2)
depends=('guile-dbi>=2.1.2' postgresql-libs)
url=https://github.com/eestrada/guile-dbi/tree/master/guile-dbd-postgresql
source=(archlinux.patch
        https://github.com/opencog/guile-dbi/archive/${pkgname}-${pkgver}.tar.gz)
md5sums=('f78f6657871b899c2f1442ff5e257d84'
         'ce9370e8e423132c33290de90ae349e2')

build(){
 cd ${srcdir}
 patch -p0 < archlinux.patch
 cd ${srcdir}/guile-dbi-${pkgname}-${pkgver}
 ./autogen.sh --prefix=/usr || return 1
 make
}

package() {
 cd ${srcdir}/guile-dbi-${pkgname}-${pkgver}
 make DESTDIR=${pkgdir} install
}
