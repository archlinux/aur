# Previous maintainer: Bjoern Franke <bjo@nord-west.org>
# Current maintainer: Janis Mezitis <janis.mezitis86@gmail.com>
pkgname=esniper
pkgver=2.35.0
pkgrel=0
pkgver_stripped='2-35-0'
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
url="http://esniper.sourceforge.net/"
license=('BSD')
depends=('curl' 'openssl')
source=(http://downloads.sourceforge.net/esniper/${pkgname}-${pkgver_stripped}.tgz)
conflicts=('esniper-git')

sha512sums=('d35c869442d7ceeb116c3f68d928eb4ff99ba3ac12f60e74dc79bfb7981b1897537f19e38dc095f8ea4b00149fe056f227f099c36127252400dc8a7a9cce17ce')

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
