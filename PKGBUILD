# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=libsufr
pkgver=0.7.8
pkgrel=1
pkgdesc="A LIBrary containing Some Useful Fortran Routines"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://libsufr.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libsufr/files/$pkgname-$pkgver.tar.gz")
sha512sums=('0b1b4413a29e76e02ba8c4a7cbf6ca3d764ce83b8d7e6da3ac6029a1f58c608d4d20f21c0084ffde6dcf40b49b3856353d51d2aad656e692c80c997f602b9cc1')

build() {
    mkdir -p "$pkgname-$pkgver"/build
    cd "$pkgname-$pkgver"/build/
    FC=gfortran cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
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
