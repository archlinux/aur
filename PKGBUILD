# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=psp-gdb
pkgver=7.3.1
pkgrel=1
pkgdesc="The GNU Debugger (psp)"
arch=(any)
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
groups=('psp')
depends=('psp-sdk')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://ftp.gnu.org/pub/gnu/gdb/gdb-7.3.1.tar.bz2" 
        "gdb-7.3.1-fix-stpcpy.patch"
        "gdb-7.3.1-PSP.patch"
        "gdb-7.3.1-texinfofix.patch")
md5sums=('SKIP'
         'SKIP' 'SKIP' 'SKIP')

prepare ()
{
  cd "$srcdir/gdb-$pkgver"
  patch -p1 -i "$srcdir"/gdb-7.3.1-fix-stpcpy.patch
  patch -p1 -i "$srcdir"/gdb-7.3.1-PSP.patch
  patch -p1 -i "$srcdir"/gdb-7.3.1-texinfofix.patch

}

build()
{
  cd "$srcdir/gdb-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp \
    --disable-werror --disable-nls 
  make 
}

package()
{
  cd "$srcdir/gdb-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  rm -r "$pkgdir"/usr/lib
}

