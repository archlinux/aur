# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libmlx4
pkgver=1.0.6
pkgrel=2
pkgdesc='OpenFabrics Alliance userspace Mellanox ConnectX InfiniBand HCA driver'
#        Plug-in module for libibverbs.
#        Allows programs to use Mellanox hardware directly from userspace.
arch=('x86_64' 'i686')
url='http://git.openfabrics.org/?p=~yishaih/libmlx4.git;a=summary'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs')
source=("https://www.openfabrics.org/downloads/mlx4/${pkgname}-${pkgver}.tar.gz"
        "compatibility.with.libibverbs.1.2.0.patch")
md5sums=('bbc1a9293a550250fb9ed8860824fad3'
         '582fe4ae3d53d33ca01f6f692fe8e4b5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/compatibility.with.libibverbs.1.2.0.patch
}

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
