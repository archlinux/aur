# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=esniper
pkgver=2.33.0
pkgrel=0
pkgver_stripped='2-33-0'
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
url="http://esniper.sourceforge.net/"
license=('BSD')
depends=('curl' 'openssl')
source=(http://downloads.sourceforge.net/esniper/${pkgname}-${pkgver_stripped}.tgz)

sha512sums=('0ce5d1f1d4860cc52c69be620fdd99065c8ac8b70e0f0042fd7426542aee78be31fa2acf2c3b230467cf20491c1238a36d7cd196238aecaff39a9560a267edd0')

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
