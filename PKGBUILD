# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=esniper
pkgver=2.32.0
pkgrel=0
pkgver_stripped='2-32-0'
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
url="http://esniper.sourceforge.net/"
license=('BSD')
depends=('curl' 'openssl')
source=(http://downloads.sourceforge.net/esniper/${pkgname}-${pkgver_stripped}.tgz)

sha512sums=('b32e93ee964489d560d9123ce5f87c5cbf94d9a0198196095a0b85411ed4ad6657f7a2531e24c1e51644562b433e418faa56b62abd8f0b6e95ce6014a746d7af')

build()
{

  cd "${srcdir}/${pkgname}-${pkgver_stripped}"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver_stripped}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -D -m755 frontends/snipe "${pkgdir}/usr/bin/snipe"
}
