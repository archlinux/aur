# Maintainer:  <gucong@gc-desktop>
pkgname=libccmio
pkgver=2.6.1
pkgrel=1
pkgdesc="CD-adapco CCM file I/O library"
arch=('i686' 'x86_64')
url="http://portal.nersc.gov/svn/visit/trunk/third_party/$pkgname-$pkgver.tar.gz"
license=('unknown')
makedepends=('qt5-base')
source=(http://portal.nersc.gov/svn/visit/trunk/third_party/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.patch)
md5sums=('f81fbdfb960b1a4f3bcc7feee491efe4'
         'da5fa4446ca71b23d15f8df8b0f5a2ec')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ -d libadf ];   then ( cd libadf;    RELEASE=1 SHARED=1 make -f Makefile.qmake all; ) fi
  if [ -d libccmio ]; then ( cd libccmio;  RELEASE=1 SHARED=1 make -f Makefile.qmake all; ) fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  libsdir=`find ./lib -name release-shared`
  install -d "$pkgdir/usr/lib" "$pkgdir/usr/include/libccmio"
  cp -vP ${libsdir}/* "$pkgdir/usr/lib"
  cp -vP libccmio/*.h "$pkgdir/usr/include/libccmio"
}

# vim:set ts=2 sw=2 et:
