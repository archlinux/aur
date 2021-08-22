# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=libsufr
pkgver=0.7.7
pkgrel=1
pkgdesc="A LIBrary containing Some Useful Fortran Routines"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://libsufr.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libsufr/files/$pkgname-$pkgver.tar.gz")
sha512sums=('c24cb69361f8db31396e554a48eb864b7cc2c8ac437b2c0d3113e02adf9a53017973e2ff49cc9a7a6debeaaea5d9f20c8aa8d505b23e1974f19b3560fded9ca4')

build() {
    mkdir -p "$pkgname-$pkgver"/build
    cd "$pkgname-$pkgver"/build/
    cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
    make
}

package() {
    # Install library:
    cd "$pkgname-$pkgver"/build/
    make install
    
    # Remove unwanted man pages:
    cd ${pkgdir}/usr/share/man/man3f/
    rm -f name.3f.gz value.3f.gz short.3f.gz long.3f.gz has_val.3f.gz
    cd -
}
