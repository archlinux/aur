# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=jdatestamp
pkgver=1.2
pkgrel=1
pkgdesc='utility to losslessly imprint date/time of a picture taken in a digital camera into its JPEG image'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/jdatestamp/"
license=('custom')
depends=('libjpeg-droppatch' 'freetype2')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}-src.tar.gz/download)
md5sums=('eaf9075f17780c6ef50f40e0865b28d1')

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
