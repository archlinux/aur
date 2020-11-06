# Maintainer: Elias Haddad <eliasynetto at gmail dot com>
pkgname=subbotools
pkgver=1.3.0
pkgrel=2
pkgdesc="Power Exponential estimation and random sampling"
arch=(x86_64)
url="http://cafim.sssup.it/~giulio/software/subbotools/index.html"
license=(GPL2)
provides=(subbotools)
conflicts=(subbotools)
source=("ftp://cafed.sssup.it/packages/$pkgname-$pkgver.tar.gz")
noextract=('$pkgname-$pkgver.tar.gz')
md5sums=('SKIP')
depends=('gsl>=2.1')

prepare(){

    # extracts the original package
    tar xvzf $pkgname-$pkgver.tar.gz

    # enter correct directory 
    cd ${pkgname}-${pkgver}

    # correct the difference in the encoding of the documentation
    # for details, see:
    # https://github.com/dankelley/gri/issues/15#issuecomment-544980426
    sed -i '/@include version.texi/a @documentencoding ISO-8859-1' ./doc/subbotools.texi 

    # correct clashes in global variables 
    sed -i 's/double \*Data/extern double *Data/1' laplafit.c
    sed -i 's/double \*Data/extern double *Data/1' laplaafit.c
    sed -i 's/unsigned Size/extern unsigned Size/1' laplafit.c
    sed -i 's/unsigned Size/extern unsigned Size/1' laplaafit.c

}


build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

check() {
    cd ${pkgname}-${pkgver}
    make check
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}




