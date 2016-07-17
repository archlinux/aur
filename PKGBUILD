# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us
pkgname=aescrypt
pkgver=3.10
pkgrel=1
pkgdesc="Use AES256 (CBC mode, password SHA256 hashed) to encrypt files"
arch=('i686' 'x86_64')
url="http://www.aescrypt.com"
license=('GPL')
# about the license: the author said so on his forum...
optdepends=('perl: for aescrypt-gui'
            'zenity: for aescrypt-gui'
            'kdialog: for aescrypt-gui')
source=(https://www.aescrypt.com/download/v3/linux/${pkgname}-${pkgver}.tgz)
sha256sums=('153da7971cc3084610943dba44e0284848af72c06d019a3c913656f8c0ad48f1')

build() {
	cd $srcdir/${pkgname}-${pkgver}/src
	make -j$(nproc)
}

package() {
	install -d $pkgdir/usr/bin $pkgdir/usr/share/man/man1 \
		$pkgdir/usr/share/aescrypt \
		$pkgdir/usr/share/applications
	install -m755 $srcdir/${pkgname}-${pkgver}/src/$pkgname \
		$srcdir/${pkgname}-${pkgver}/src/${pkgname}_keygen \
		$srcdir/${pkgname}-${pkgver}/gui/${pkgname}-gui \
		$pkgdir/usr/bin/
	install -m644 $srcdir/${pkgname}-${pkgver}/man/$pkgname.1 \
		$pkgdir/usr/share/man/man1/
	install -m644 $srcdir/${pkgname}-${pkgver}/gui/AESCrypt.desktop \
		$pkgdir/usr/share/applications
	install -m644 $srcdir/${pkgname}-${pkgver}/gui/SmallLock.png \
		$pkgdir/usr/share/aescrypt
}

