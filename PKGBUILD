# Maintainer: Vincent gatine <nurelin15@gmail.com>

pkgname=genext2fs
pkgver=1.4.1
pkgrel=1
pkgdesc="ext2 filesystem generator for embedded systems"
arch=(i686 x86_64)
url="http://genext2fs.sourceforge.net"
license=('GPL2')
depends=('glibc')
makedepends=()
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b7b6361bcce2cedff1ae437fadafe53b')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
