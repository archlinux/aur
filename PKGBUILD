# Maintainer:
# Contributor: Judd Vinet <judd@archlinux.org>

pkgname=bridge-utils
pkgver=1.5
pkgrel=1
pkgdesc="Utilities for configuring the Linux ethernet bridge"
arch=('i686' 'x86_64')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
license=('GPL')
depends=('glibc')
backup=('etc/conf.d/bridges')
source=(http://downloads.sourceforge.net/bridge/bridge-utils-$pkgver.tar.gz
        bridges.conf.d)
md5sums=('ec7b381160b340648dede58c31bb2238'
         'f5d691282653580dd5fd4a1092ef365b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  aclocal
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
   
  # install config file
  install -Dm644 ../bridges.conf.d "${pkgdir}/etc/conf.d/bridges"
}
