# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

_archivename=gcc
_target=mipsel-linux
_pkgbasename=libstdc++
pkgname=$_target-${_pkgbasename}5
pkgver=3.3.4
pkgrel=1
pkgdesc="mipsel-linux GNU Standard C++ library version 3"
url="http://www.gnu.org/software/$_archivename/"
depends=($_target-binutils $_target-gcc3)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver/$_archivename-$pkgver.tar.bz2)
md5sums=('a1c267b34f05c8660b24251865614d8b')

build() {
	mkdir -p $startdir/src/$_pkgbasename-build
	cd $startdir/src/$_pkgbasename-build
	$startdir/src/$_archivename-$pkgver/$_pkgbasename-v3/configure \
		--target=$_target --prefix=/usr \
		--enable-version-specific-runtime-libs \
		--with-gnu-as --with-gnu-ld \
		--disable-threads || return 1
	make || return 2
	make DESTDIR=$startdir/pkg install || return 3

# 	mv $startdir/pkg/usr/lib/libiberty.a $startdir/pkg/usr/$_target/lib/ 
# 	rmdir $startdir/pkg/usr/lib 
# 	mkdir -p $startdir/pkg/usr/$_target/bin/ 
# 	for FILE in $startdir/pkg/usr/bin/$_target-*; do 
# 		ln -s ${FILE/*///usr/bin/}  
# 			$startdir/pkg/usr/$_target/bin/${FILE/*$_target-/} 
# 	done 
# 	for MANPAGE in cpp gcov; do 
# 		mv $startdir/pkg/usr/man/man1/${MANPAGE}.1  
# 			$startdir/pkg/usr/man/man1/$_mipsel-${MANPAGE}.1 
# 	done 
# 	# already present in the system 
# 	rm -rf $startdir/pkg/usr/man/man7/ 
}
