# Maintainer: M0Rf30

pkgname=ibm-tss
pkgver=10.45
pkgrel=1
pkgdesc="A user space TSS for TPM 2.0 by IBM"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ibmtpm20tss/"
license=('BSD')
depends=('openssl')
source=("https://downloads.sourceforge.net/project/ibmtpm20tss/ibmtss1045.tar.gz")

build() {
   cd $srcdir/utils
   make -f makefile
}

package() {
   cd $srcdir/utils
   mkdir -p $pkgdir/usr/bin
   find . -perm /a+x -exec cp {} $pkgdir/usr/bin \;
   cd $pkgdir/usr
   mkdir lib
   rm bin/{clear,import,shutdown,*.sh}
   mv bin/libtss.so lib/
}

md5sums=('3314ffff877a48aebc1da9b44ff5290d')
