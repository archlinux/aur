# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs
pkgname=libibmad
pkgver=1.3.12
pkgrel=1
pkgdesc="OpenFabrics Alliance InfiniBand MAD library"
groups=('ofed')
url="http://www.openfabrics.org"
arch=('x86_64' 'i686')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibumad')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
# cksum start
# cksum end
md5sums=('7aabf50569c4d30a9a0689fd96097e4f')
sha512sums=('6c17d4b5c3a3cb2b682644e29c0aff0a34bc6d25c2fe007791cf08a59094dc3d1ee07f1dae5f81860f80b75de03617b55fa7ad4f11037d40c7d920fc99273330')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
