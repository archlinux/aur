# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=jasper
pkgver=1.900.1
pkgrel=8
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard"
arch=('i686' 'x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('libjpeg' 'freeglut' 'libxmu' 'glu')
options=('!libtool')
source=(http://www.ece.uvic.ca/~mdadams/${pkgname}/software/${pkgname}-${pkgver}.zip jpc_dec.c.patch
        patch-libjasper-stepsizes-overflow.diff jasper-1.900.1-CVE-2008-3520.patch
        jasper-1.900.1-CVE-2008-3522.patch)
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191'
          'c1a0176a15210c0af14d85e55ce566921957d780'
          'f298566fef08c8a589d072582112cd51c72c3983'
          '2483dba925670bf29f531d85d73c4e5ada513b01'
          '0e7b6142cd9240ffb15a1ed7297c43c76fa09ee4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/jpc_dec.c.patch"
  patch -p1 -i "${srcdir}/patch-libjasper-stepsizes-overflow.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3520.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3522.patch"
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-shared
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
