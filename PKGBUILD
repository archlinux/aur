# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Judd Vinet <judd@archlinux.org>

pkgname=bridge-utils
pkgver=1.7
pkgrel=1
pkgdesc="Utilities for configuring the Linux ethernet bridge"
arch=('x86_64')
url='https://wiki.linuxfoundation.org/networking/bridge'
license=('GPL')
depends=('glibc')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E')	# Stephen Hemminger (Microsoft corporate) <sthemmin@microsoft.com>
source=("https://kernel.org/pub/linux/kernel/people/shemminger/${pkgname}//${pkgname}-${pkgver}.tar."{xz,sign})
sha256sums=('939987e659b1a4c36ae46f44b6687f373bc5c916a9eab91f775630f5e38b997e'
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
