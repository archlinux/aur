# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=tv
pkgver=1.9.13
pkgrel=4
pkgdesc="Spectra- and matrix-analysis program developed at IKP, Köln, Germany"
url="http://www.ikp.uni-koeln.de/misc/doc/Tv_user-manual/Tv_user-manual.html"
arch=('x86_64' 'i686')
license=('custon')
#http://www.ikp.uni-koeln.de/misc/doc/Tv_user-manual/node229.html
depends=('mfile' 'xaw3d' 'readline')
makedepends=('latex2html')
options=('!emptydirs')

source=("http://www.ikp.uni-koeln.de/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('5b739a811abe604cbe4160e4402796dc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/doc/tex/Manual
  make all html
}

package() {

  [ -d ${pkgdir}/usr/share/X11/app-defaults ] || install -d ${pkgdir}/usr/share/X11/app-defaults
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-appdefaultdir=${pkgdir}/usr/share/X11/app-defaults
  make DESTDIR=${pkgdir} install

  [ -d ${pkgdir}/usr/share/doc/${pkgname} ] || install -d ${pkgdir}/usr/share/doc/${pkgname}
  cp -r  ${srcdir}/${pkgname}-${pkgver}/doc/tex/Manual/Tv_user-manual ${pkgdir}/usr/share/doc/${pkgname}/
  install -Dm644 $srcdir/${pkgname}-${pkgver}/doc/tex/Manual/Tv_user-manual.ps.gz ${pkgdir}/usr/share/doc/${pkgname}/
}
