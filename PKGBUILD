# Maintainer: robertfoster

pkgname=icc_examin
pkgver=0.56
pkgrel=1
pkgdesc="ICC Examin is a colour management utility."
url="http://oyranos.org/"
arch=('i686' 'x86_64')   
depends=('ftgl' 'fltk' 'openicc' 'oyranos')
optdepends=(argyllcms cinepaint-oyranos)
source=("https://github.com/oyranos-cms/icc-examin/archive/$pkgver.tar.gz"
	configure_tests.patch)
license=('MIT')

build() {
    cd $srcdir/icc-examin-$pkgver
    unset LDFLAGS
    patch -Np0 <"$srcdir"/configure_tests.patch
    ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
    make
}

package() {    
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}

md5sums=('079b3d4babf6c981d11cc0e30eb6307f'
         'b84b2b1913026b82b99f682d73f24b8d')
