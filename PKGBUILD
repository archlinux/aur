# Maintainer: AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libthesky
pkgver=0.4.3
pkgrel=1
pkgdesc="Fortran library to compute the positions of celestial bodies and events with great accuracy"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://libthesky.sourceforge.net/"
license=('GPL3')
depends=('libsufr' 'libthesky-data')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("https://sourceforge.net/projects/libthesky/files/$pkgname-$pkgver.tar.gz")
sha512sums=('f859f6ac73928b36cefdf5cb3b6f74c3170eb0fc890e4b5f18beab62debf36beb8e26ac964d803524b38f2d07e8bd148eeb2f3bc556cdbff4ee2e24e749584f2')

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
    rm -f maxlocs.3f.gz lat0.3f.gz lon0.3f.gz height.3f.gz deltat.3f.gz tz.3f.gz tz0.3f.gz second.3f.gz day.3f.gz year.3f.gz month.3f.gz hour.3f.gz minute.3f.gz dsttp.3f.gz
    rm -f c1.3f.gz c2.3f.gz ath.3f.gz a0.3f.gz p1.3f.gz p2.3f.gz p3.3f.gz p4.3f.gz p5.3f.gz q1.3f.gz q2.3f.gz q3.3f.gz q4.3f.gz q5.3f.gz w.3f.gz eart.3f.gz peri.3f.gz p.3f.gz del.3f.gz zeta.3f.gz t.3f.gz pre.3f.gz coef.3f.gz zone.3f.gz pc1.3f.gz pc2.3f.gz pc3.3f.gz per1.3f.gz per2.3f.gz per3.3f.gz ilu.3f.gz ipla.3f.gz nterm.3f.gz nrang.3f.gz prec0.3f.gz ideb.3f.gz
    cd -
}
