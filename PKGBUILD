# Maintainer: David Runge <dave@sleepmap.de>
pkgname=dhcp_probe
pkgver=1.3.0
pkgrel=5
pkgdesc="Allows network administrators to make calculations that will assist in subnetting a network"
arch=('x86_64')
url="https://www.net.princeton.edu/software/dhcp_probe/"
license=('GPL2')
depends=('libnet' 'libpcap')
source=("https://www.net.princeton.edu/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d643012529ee5149adbc0c1f19f8e579c55201e86de2aec9b3313be9412db4e973162f864d1baaf79fa340b7bd9a7385f0f1406d1b616e801ced3c7bb387c854')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm 644 {AUTHORS,ChangeLog,NEWS,PLATFORMS,README,TODO}
}

# vim:set ts=2 sw=2 et:
