# Maintainer: danirod <dani@danirod.es>
# Contributor: c0repwn3r <core@coredoes.dev>
pkgname=i386-elf-gdb
pkgver=17.2
pkgrel=1
epoch=
pkgdesc="GNU debugger crosscompiled for i386 development"
arch=(x86_64)
url="https://www.gnu.org/software/gdb"
license=('GPL-3.0-or-later')
groups=(i386-elf-toolchain)
makedepends=(gmp mpfr)
depends=(xz libmpc i386-elf-gcc gdb) # GDB is included to prevent conflicts with it - otherwise this package won't function
source=(
    "http://ftpmirror.gnu.org/gdb/gdb-$pkgver.tar.xz"
)
sha256sums=('1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c')
options=(!strip)

build() {
    mkdir -p "i386-gdb-$pkgver-build"
    cd "i386-gdb-$pkgver-build"
    # Configure, we are building in seperate directory to cleanly seperate the binaries from the source
    ../gdb-$pkgver/configure --target=i386-elf --prefix=/usr --program-prefix=i386-elf-

    # Build
    make
}

package() {
    cd "i386-gdb-$pkgver-build"
    make install DESTDIR=$pkgdir
    # Remove conflicting files
    rm -rf $pkgdir/usr/share/locale/
    rm -rf $pkgdir/usr/share/gdb
    rm -rf $pkgdir/usr/include/gdb
    rm -rf $pkgdir/usr/share/info/dir
}
