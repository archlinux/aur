# Maintainer: robertfoster

pkgname=ibm-tss
pkgver=1331
pkgrel=1
pkgdesc="A user space TSS for TPM 2.0 by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmtpm20tss/"
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/project/ibmtpm20tss/ibmtss$pkgver.tar.gz")

build() {
	cd $srcdir/utils
	make all
}

package() {
	cd $srcdir/utils
msg2 "Managing binaries and libs"
	mkdir -p $pkgdir/usr/bin
	find . -perm /a+x -type f -exec cp {} $pkgdir/usr/bin \;
	cd $pkgdir/usr
	mkdir lib
        cp $srcdir/utils/*.so lib/
msg2 "Cleaning up"
	rm bin/{clear,import,shutdown,*.sh,*.so.0.1}
	cp $srcdir/utils/*.so lib/
}

md5sums=('95068099d4a3aebd22632a0e8878b1d7')
