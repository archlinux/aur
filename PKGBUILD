# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=libsufr
pkgver=0.7.3
pkgrel=2
pkgdesc="A LIBrary containing Some Useful Fortran Routines"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://libsufr.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libsufr/files/$pkgname-$pkgver.tar.gz")
sha512sums=('99b1b2b671c47bf9bd00a9ba3aacceac037db70d90fe9e000c97a7f88efcbc479651e207fca04afbfc2d29468fb8acf721a0fe3dcf41555270d956a2c2c72956')

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
