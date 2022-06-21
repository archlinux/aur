# Maintainer: Huayu ZHANG <zhanghuayu1233@gmail.com>

pkgname=i686-elf-gdb-git
pkgver=12.1
pkgrel=1
pkgdesc="GNU debugger crosscompiled for i686 development (development version)"
arch=(x86_64)
url="https://www.gnu.org/software/gdb"
license=('GPL')
#groups=(i686-elf-toolchain-git)
makedepends=(gmp mpfr)
depends=(xz libmpc gdb) # GDB is included to prevent conflicts with it - otherwise this package won't function
#depends=(xz libmpc i686-elf-binutils-git i686-elf-gcc-git gdb)
replaces=("i686-elf-gdb")
conflicts=("i686-elf-gdb")
#source=("git+https://sourceware.org/git/binutils-gdb.git")
#sha256sums=("SKIP")
source=("https://ftp.gnu.org/gnu/gdb/gdb-12.1.tar.xz")
sha256sums=("0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed")
OPTIONS=(!strip)

_sysroot=/usr/lib/i686-elf
_target=i686-elf

build() {
    mkdir -p "i686-gdb-build"
    #cd "binutils-gdb"
	cd "i686-gdb-build"
	../gdb-$pkgver/configure --target=i686-elf --prefix=/usr --program-prefix=i686-elf-
	
	# for git package
    #./configure --target=${target} \
    #../gdb-${pkgver}/configure --target=${target} \
    		#--host=x86_64 \
		    #--prefix=${_sysroot} \ 
			#--bindir=/usr/bin \
			#--libdir=/usr/lib/i686-elf/ \
			#--with-sysroot=${_sysroot} \
			#--disable-nls \
			#--disable-werror \
	    	#--disable-binutils 


    # Build
    make -j$(nproc)
}

package() { 
    #cd "binutils-gdb"
	cd "i686-gdb-build"
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
