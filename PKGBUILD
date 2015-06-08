# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=esniper
pkgver=2.31.0
pkgrel=2
pkgver_stripped='2-31-0'
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'arm')
url="http://esniper.sourceforge.net/"
license=('BSD')
depends=('curl' 'openssl')
source=(http://downloads.sourceforge.net/esniper/${pkgname}-${pkgver_stripped}.tgz)

sha512sums=('7f52f4df0cee80f221a5f0be47c10501496eb717845535c9c92946e70ee8a0b37755e3b7267cf19175bfb272d6f5afd906276e99cfd1301cc78313177c48b983')



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
