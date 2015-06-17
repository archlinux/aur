# Maintainer: M0Rf30
pkgname=icc_examin
pkgver=0.55
pkgrel=2
pkgdesc="ICC Examin is a colour management utility."
url="http://oyranos.org/"
arch=('i686' 'x86_64')   
depends=('ftgl' 'fltk' 'openicc' 'oyranos')
optdepends=(argyllcms cinepaint-oyranos)
source=("http://prdownloads.sourceforge.net/oyranos/$pkgname-$pkgver.tar.bz2"
	"configure_tests.patch")
license=('MIT')

build() {
    cd $srcdir/$pkgname-$pkgver
    unset LDFLAGS
    patch -Np0 <"$srcdir"/configure_tests.patch
    ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
    make
}

package() {    
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}

md5sums=('51ba3b849eb47793974cab6956750cf0'
         'b84b2b1913026b82b99f682d73f24b8d')
