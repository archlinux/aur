# $Id: PKGBUILD 252466 2015-12-05 16:35:01Z fyan $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=xbase
pkgver=2.0.0
pkgrel=4
pkgdesc="A compatible C++ class library"
arch=('i686' 'x86_64')
url='http://linux.techass.com/projects/xdb/'
license=('LGPL')
depends=('bash' 'gcc-libs')
source=("http://downloads.sourceforge.net/xdb/${pkgname}-${pkgver}.tar.gz"
        'fix-build.patch'
        'gcc43.patch'
        'gcc47.patch')
md5sums=('9b29362031716a12491beb9f8cc882f2'
         'f66c1d19a51552b1748ab9158156b103'
         '0d5a59a59eb2c79d172bd4339de35372'
         '879bf5107605eee2cbec2dca116edac6')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i "${srcdir}/fix-build.patch"
  patch -p1 -i "${srcdir}/gcc43.patch"
  patch -p1 -i "${srcdir}/gcc47.patch"
}

build() {
  cd ${pkgname}-${pkgver}

  unset CPPFLAGS

  # Workaround to build on x86_64
  ./configure --host=i686-pc-linux-gnu --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make -k check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
