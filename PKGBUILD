# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs
pkgname=libibumad
pkgver=1.3.10.2
pkgrel=1
pkgdesc="OpenFabrics Alliance InfiniBand umad (user MAD) library"
groups=('ofed')
url="http://www.openfabrics.org"
arch=('x86_64' 'i686')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
md5sums=('dd017844c55713bd335aa229e6841d41')
sha512sums=('aa2e9038600f6fd9f5cd7c42f6125f25db1504eca040d48f501acf3dcba310f5af50d56fbfe959d1f33b3eacd382f33782077510c7f1a841ae12c5942eb7fa8c')

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
