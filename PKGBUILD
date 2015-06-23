# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# $Id: PKGBUILD 84937 2010-07-05 17:46:04Z eric $
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=urjtag-svn
pkgver=0.10.r2040
pkgrel=2
pkgdesc="Enhanced, modern tool for communicating over JTAG with flash chips, CPUs,and many more"
arch=("i686" "x86_64")
url="http://urjtag.org/"
license=("GPL2" "LGPL2.1")
depends=('libftd2xx')
makedepends=('svn' 'gcc' 'libftd2xx' 'flex' 'bison')
#makedepends=(svn gcc flex bison)
conflicts=('urjtag')
options=('!strip')
source=('svn+http://urjtag.svn.sourceforge.net/svnroot/urjtag/trunk'
        'urjtag_libftd2xx.patch')
md5sums=('SKIP'
         '366620fd96427e69e37dd761dd173be9')

pkgver() {
    cd trunk/urjtag
    local ver="$(svnversion)"
    printf "0.10.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk/urjtag"
#  cd "$srcdir/$pkgname-$pkgver/trunk/urjtag"
#  if [ ! -f _patched ]; then
#    patch -p1 <../../urjtag_libftd2xx.patch
#    touch _patched
#  fi
  if [ ! -f ./configure ]; then
    ./autogen.sh
  fi
  ./configure --prefix=/usr
#  ./configure --prefix=/usr --without-ftd2xx
#  ./configure --prefix=/usr CFLAGS="-Wno-error=unused-but-set-variable"
  make
}

package() {
  cd "$srcdir/trunk/urjtag"
  make DESTDIR="$pkgdir" install
}

