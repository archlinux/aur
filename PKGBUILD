# Maintainer: Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: jjbca

pkgname=vis5d+
pkgver=1.2.1
pkgrel=8
pkgdesc="A system for interactive visualization of large 5-D gridded data sets"
url="http://vis5d.sourceforge.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('netcdf' 'xorg-server' 'mesa')
source=("http://downloads.sourceforge.net/vis5d/$pkgname-$pkgver.tar.bz2" "patch")
md5sums=('15a8b09ba8ae57b753e724d0825e40c1'
         'a1d73b709e03ca09fe2ce5954ac4f914')

build() {
    cd $srcdir/$pkgname-$pkgver
    patch -Np1 -i $srcdir/patch
    export FC=gfortran 
    export F77=gfortran 
    export CFLAGS="$CFLAGS -fno-range-check" 
    export FFLAGS="$FFLAGS -fno-range-check"
    export CPPFLAGS="$CFLAGS -DUSE_INTERP_ERRORLINE -DUSE_INTERP_RESULT"
    ./configure --prefix=/usr --with-netcdf=/usr/lib/ --with-x V5D_LIBS_AUX="/usr/include/" \
    --with-Tcl_Eval=yes --with-mesa --enable-threads #--enable-gtk #--with-mixkit=/usr/lib
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}