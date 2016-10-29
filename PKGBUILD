# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=esniper
pkgver=2.31.0
pkgrel=3
pkgver_stripped='2-31-0'
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'arm')
url="http://esniper.sourceforge.net/"
license=('BSD')
depends=('curl' 'openssl')
source=(http://downloads.sourceforge.net/esniper/${pkgname}-${pkgver_stripped}.tgz http://sprunge.us/OjeN)

sha512sums=('7f52f4df0cee80f221a5f0be47c10501496eb717845535c9c92946e70ee8a0b37755e3b7267cf19175bfb272d6f5afd906276e99cfd1301cc78313177c48b983' '537d11183e389a1cb3739af4389988d172e5f667f7b9d46d99db9b3ea707a65bc751b72c8345abe249151dcb33f1a104510f796ce4dd8868a11c8deb2ae2cec7')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver_stripped}"
 	patch -Np0 -i "${srcdir}/OjeN"
}

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
