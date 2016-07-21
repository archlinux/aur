# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libmlx5
pkgver=1.2.1
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand Mellanox Connect-IB InfiniBand HCA driver'
#        Plug-in module for libibverbs.
#        Allows programs to use Mellanox hardware directly from userspace.
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/mlx5/${pkgname}-${pkgver}.tar.gz")
md5sums=('eecd015a2c4f2452a0a1cbc121b40712')

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
