# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>

pkgname=libmlx4
pkgver=1.0.6
pkgrel=1
pkgdesc='OpenFabrics Alliance userspace Mellanox ConnectX InfiniBand HCA driver'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/downloads/mlx4/README.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/mlx4/${pkgname}-${pkgver}.tar.gz")
md5sums=('bbc1a9293a550250fb9ed8860824fad3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
