# Maintainer: aTc <aTc-Arch@k-n-p.org>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=gzip-rsyncable
pkgver=1.6
pkgrel=1
pkgdesc="GNU compression utility"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gzip/"
license=('GPL3')
groups=('base' 'base-devel')
depends=('glibc' 'bash' 'less')
provides=('gzip')
conflicts=('gzip')
install=gzip.install
source=(ftp://ftp.gnu.org/pub/gnu/gzip/gzip-$pkgver.tar.xz
	debian_patches_rsyncable.diff )

md5sums=('da981f86677d58a106496e68de6f8995'
         '21aab4810c49c9a7fd0a09b7a7749e58')

prepare() {
  cd ${srcdir}/gzip-${pkgver}
  patch -p1 < $srcdir/debian_patches_rsyncable.diff
}

build() {
  cd ${srcdir}/gzip-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${srcdir}/gzip-${pkgver}
  make check
}

package() {
  cd ${srcdir}/gzip-${pkgver}
  make prefix=${pkgdir}/usr install
}
