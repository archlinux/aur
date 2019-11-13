# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Judd Vinet <judd@archlinux.org>

pkgname=bridge-utils
pkgver=1.6
pkgrel=4
pkgdesc="Utilities for configuring the Linux ethernet bridge"
arch=('x86_64')
url='https://wiki.linuxfoundation.org/networking/bridge'
license=('GPL')
depends=('glibc')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E')	# Stephen Hemminger (Microsoft corporate) <sthemmin@microsoft.com>
source=("https://www.kernel.org/pub/linux/utils/net/${pkgname}/${pkgname}-${pkgver}.tar."{xz,sign})
sha256sums=('cc67efb5d5fb8928a6569b3fade2b4042ec17da04678dab127d96b46489e26c8'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  aclocal
  autoconf
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
