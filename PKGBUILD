# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libmlx4
pkgver=1.2.1
pkgrel=1
pkgdesc='OpenFabrics Alliance userspace Mellanox ConnectX InfiniBand HCA driver'
#        Plug-in module for libibverbs.
#        Allows programs to use Mellanox hardware directly from userspace.
arch=('x86_64' 'i686')
url='http://git.openfabrics.org/?p=~yishaih/libmlx4.git;a=summary'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/mlx4/${pkgname}-${pkgver}.tar.gz")
md5sums=('c09b34b427fa4bccae38a10c9758fc34')

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
