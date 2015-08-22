# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=jasper
pkgver=1.900.1
pkgrel=14
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard"
arch=('i686' 'x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('libjpeg')
makedepends=('freeglut' 'libxmu' 'glu')
optdepends=('freeglut: for jiv support' 'glu: for jiv support')
source=(http://www.ece.uvic.ca/~mdadams/${pkgname}/software/${pkgname}-${pkgver}.zip
        patch-libjasper-stepsizes-overflow.diff jasper-1.900.1-CVE-2008-3520.patch
        jpc_dec.c.patch jasper-1.900.1-CVE-2008-3522.patch
        jasper-1.900.1-CVE-2014-8137.patch jasper-avoid-assert-abort.diff
        jasper-1.900.1-CVE-2014-8138.patch jasper-1.900.1-CVE-2014-9029.patch
	jasper-1.900.1-CVE-2011-4516-and-CVE-2011-4517.patch
        jasper-1.900.1-fix-filename-buffer-overflow.patch
	jasper-1.900.1-CVE-2014-8157.patch
	jasper-1.900.1-CVE-2014-8158.patch
        jasper-1.900.1-CVE-2015-5203.patch)
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191'
          'f298566fef08c8a589d072582112cd51c72c3983'
          '2483dba925670bf29f531d85d73c4e5ada513b01'
          'c1a0176a15210c0af14d85e55ce566921957d780'
          '0e7b6142cd9240ffb15a1ed7297c43c76fa09ee4'
          '437519aaaeff6076d11cdbea82125dbcac6f729b'
          '98548b610a7319e569ee0425a32dc1d31a8771d2'
          '6086e717af2f0a026f70e399e28fe115f08a8cc1'
          'f5fe80c8576379d34f372f6a7c6a76630ab9fdcd'
          '3bfb37a4c732caa824563bad2603fcf5f2acf7f7'
          '577dfce40da75818c4d32eb1c4532b1370950bee'
          'aaf96946073d2ece35f3695e8cc7956b5cad9a1d'
          'e69b339de43d1dc2fbb98368cee3d20f76d35941'
          'b28a15079e6c5dd4cde8d63c21763c8abb9d187c')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/jpc_dec.c.patch"
  patch -p1 -i "${srcdir}/patch-libjasper-stepsizes-overflow.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3520.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3522.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-9029.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8137.patch"
  patch -p1 -i "${srcdir}/jasper-avoid-assert-abort.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8138.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2011-4516-and-CVE-2011-4517.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-fix-filename-buffer-overflow.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8157.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8158.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2015-5203.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
