# Maintainer: robertfoster

pkgname=ibm-tss
pkgver=1331
pkgrel=2
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
	mkdir -p $pkgdir/usr/lib
	mv $srcdir/utils/*.so* $pkgdir/usr/lib/
        find . -perm /a+x -type f -exec cp {} $pkgdir/usr/bin \;

	msg2 "Cleaning up"
	rm $pkgdir/usr/bin/{clear,import,shutdown,*.sh}
}

md5sums=('95068099d4a3aebd22632a0e8878b1d7')
