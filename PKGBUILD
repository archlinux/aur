# Maintainer:
# Contributor: Judd Vinet <judd@archlinux.org>

pkgname=bridge-utils
pkgver=1.5
pkgrel=2
pkgdesc="Utilities for configuring the Linux ethernet bridge"
arch=('i686' 'x86_64')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/bridge/bridge-utils-$pkgver.tar.gz
        bridge-utils-1.5-linux_3.8.x.patch)

prepare () {
  # fix compiling with newer kernel headers
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../bridge-utils-1.5-linux_3.8.x.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  autoconf
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('ec7b381160b340648dede58c31bb2238'
         'fba700dcb2a3225d72b3bae64c7f49ca')
