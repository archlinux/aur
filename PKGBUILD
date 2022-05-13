# Maintainer: c0repwn3r <core@coredoes.dev>
pkgname=i686-elf-gdb
pkgver=11.1
pkgrel=4
epoch=
pkgdesc="GNU debugger crosscompiled for i686 development"
arch=(x86_64)
url="https://www.gnu.org/software/gdb"
license=('GPL')
groups=(i686-elf-toolchain)
makedepends=(gmp mpfr)
depends=(xz libmpc i686-elf-gcc gdb) # GDB is included to prevent conflicts with it - otherwise this package won't function
source=(
    "http://ftpmirror.gnu.org/gdb/gdb-$pkgver.tar.xz"
)
sha256sums=(
    cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94
)
OPTIONS=(!strip)

build() {
    mkdir -p "i686-gdb-$pkgver-build"
    cd "i686-gdb-$pkgver-build"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../gdb-$pkgver/configure --target=i686-elf --prefix=/usr --program-prefix=i686-elf-

    # Build
    make
}

package() {
    cd "i686-gdb-$pkgver-build"
    make install DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/locale/
    rm -rf $pkgdir/usr/share/gdb
    rm -rf $pkgdir/usr/include/gdb
    rm -rf $pkgdir/usr/share/info/dir
    rm -rf $pkgdir/usr/share/info/
    rm -rf $pkgdir/usr/include/sim/callback.h
    rm -rf $pkgdir/usr/include/sim/sim.h
}
