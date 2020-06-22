# Maintainer: Teodor Spæren <teodor_spaeren@riseup.net>
# Contributor: C. N. Hsing <jlhs@users.noreply.github.com>
pkgname=enchive
pkgver=3.5
pkgrel=1
pkgdesc="Utility for encrypting/decrypting single files with key pair"
arch=('x86_64' 'i686')
url="https://github.com/skeeto/enchive"
license=('custom:UNLICENSE')
source=("https://github.com/skeeto/${pkgname}/releases/download/${pkgver}/enchive-${pkgver}.tar.xz"{,.sig})
sha256sums=('cb867961149116443a85d3a64ef5963e3c399bdd377b326669bb566a3453bd06'
            'SKIP')
validpgpkeys=('5EEB8C8D5069C4E9B94AA852AFD1503A8C8FF42A') # Christopher Wellons <wellons@nullprogram.com>

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -pDm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -pDm644 enchive-mode.el "${pkgdir}/usr/share/emacs/site-lisp/enchive-mode.el"
}
