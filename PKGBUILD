# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: bender02 at archlinux dot us
pkgname=aescrypt
pkgver=3.12
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
sha256sums=('4e88335b335c3c7e5374d13b527b8ef8940bbe87b48a2734c600fd56b5ef1e23')

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

