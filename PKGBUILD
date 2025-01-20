# Contributor: perlawk
# Maintainer: aksr <aksr at t-com dot me>
pkgname=match
pkgver=1.1
pkgrel=2
pkgdesc='A powerful tool for syntax analysis, the main idea of pattern matching comes from the SNOBOL4 language.'
url='http://www.dmitry-kazakov.de/match/match.htm'
arch=('i686' 'x86_64')
license=('GPLv3')
source=("http://www.dmitry-kazakov.de/$pkgname/${pkgname}_${pkgver/./_}.tgz")
md5sums=('cd1de3c51078902034b05d7e8e6c8919')
sha1sums=('412bee7e72821be67d7244c933b525b9bf4f6a5b')
sha256sums=('9661b18833f6f5c617a0cd99417bcb63cd110822d93da39e651cb12f77620d55')
options=(!strip)
	
prepare() {
	cd "${srcdir}/"
	sed -i '/SILENCE/d;' gcc.mak
	sed -i 's/-c/-c $(CPPFLAGS) $(CFLAGS)/g' gcc.mak
}
build() {
	gcc -fpic -shared match.c -o libmatch.so
	CFLAGS='-fcommon -fpermissive' make -f gcc.mak
}
	
package() {
	cd "${srcdir}/"
	mkdir -p $pkgdir/usr/{bin,include,share/match,lib}/
	cp -a match "$pkgdir/usr/bin" 
	cp libmatch.so "$pkgdir/usr/lib/" 
	cp match.h pattern.h patran.h "$pkgdir/usr/include/" 
	cp match.htm *gif *jpg "$pkgdir/usr/share/$pkgname/" 
}
