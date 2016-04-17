# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=libsufr
pkgver=0.7.2
pkgrel=2
pkgdesc="A LIBrary containing Some Useful Fortran Routines"
arch=('i686' 'x86_64')
url="http://libsufr.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libsufr/files/$pkgname-$pkgver.tar.gz")
sha512sums=('3259b46a7f70c44f60a8d419aa9d007be6a6eac239809148ab790e1ce97f161f88ba8711603a70c6fa51c6bc06d614fd8a99383efa09b498cdc0364de0e63d1d')

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
