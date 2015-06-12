# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=jdatestamp
pkgver=1.1
pkgrel=1
pkgdesc='utility to losslessly imprint date/time of a picture taken in a digital camera into its JPEG image'
arch=('i686')
url="http://sourceforge.net/projects/jdatestamp/"
license=('custom')
depends=('libjpeg-droppatch' 'freetype2')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-src.zip/download)
md5sums=('45ef6c542acda5785dcb3b8b87e3b47d')

build() {
cd ${srcdir}/$pkgname-$pkgver-src
sed -i -e 's/LIBJPEG =.*/LIBJPEG =\/usr/' -e 's/FREETYPE2 =.*/FREETYPE2 =\/usr/' -e '/STATICLIBS/s/-Wl,//' makefile
make
}

package() {
cd ${srcdir}/$pkgname-$pkgver-src
mkdir -p ${pkgdir}/usr/{share/doc/jdatestamp,bin}
install -D -m755 ./jdatestamp ${pkgdir}/usr/share/jdatestamp/jdatestamp
install -D -m644 installFiles/* ${pkgdir}/usr/share/jdatestamp || true
install -D -m644 installFiles/docs/* ${pkgdir}/usr/share/doc/jdatestamp || true
ln -s /usr/share/jdatestamp/jdatestamp ${pkgdir}/usr/bin/jdatestamp
}
