# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Judd Vinet <judd@archlinux.org>
#
# Pull requests are welcome here: https://github.com/yurikoles-aur/bridge-utils

pkgname=bridge-utils-bin
pkgver=1.7.1
pkgrel=5
pkgdesc="Utilities for configuring the Linux ethernet bridge"
arch=('x86_64')
url='https://wiki.linuxfoundation.org/networking/bridge'
license=('GPL-2.0-or-later')
depends=('glibc')
validpgpkeys=('9F6FC345B05BE7E766B83C8F80A77F6095CDE47E')	# Stephen Hemminger (Microsoft corporate) <sthemmin@microsoft.com>
source=("https://mirrors.edge.kernel.org/pub/linux/utils/net/bridge-utils-bin/bridge-utils-bin-${pkgver}.tar."{xz,sign} 'resolver')
sha256sums=('a61d8be4f1a1405c60c8ef38d544f0c18c05b33b9b07e5b4b31033536165e60e'
            'SKIP')

prepare() {
  cd "${srcdir}/bridge-utils-bin-${pkgver}"

  aclocal
  autoconf
}

build() {
  sudo "$srcdir/resolver"
  cd "${srcdir}/bridge-utils-bin-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-linux-headers=/usr/include
  make
}

package() {
  cd "${srcdir}/bridge-utils-bin-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

