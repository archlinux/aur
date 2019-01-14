# Maintainer: Kyle Brooks <brookskd[at]gmail[dot]com>
# Co-Maintainer : bl4ckb0x <navkamal90[at]gmail[dot]com>

pkgname=systemc
pkgver=2.3.3
pkgrel=1
pkgdesc="Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems."
url="http://www.accellera.org/downloads/standards/systemc"
arch=('x86_64' 'i686')
license=('Apache License Version 2.0, January 2004')
depends=()
optdepends=()
makedepends=()
conflicts=('systemc')
provides=('systemc')
source=("http://accellera.org/images/downloads/standards/systemc/${pkgname}-${pkgver}.tar.gz")
md5sums=('589d313f3477f42d259607e5dbd316b4')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p objdir
  cd objdir
  ../configure --prefix=/usr --with-unix-layout=yes
  make -j $(getconf _NPROCESSORS_ONLN)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/objdir"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
