# Maintainer: JSH <jsh6789 at gmail dot com>
# Contributor: Andres Erbsen <andres@krutt.org>

pkgname=mnemonicode
pkgver=0.73
pkgrel=3
pkgdesc="Programs for encoding binary data into a sequence of words"
depends=('glibc')
arch=('i686' 'x86_64')
url="https://github.com/singpolyma/mnemonicode"
license=('MIT')
source=("http://ftp.de.debian.org/debian/pool/main/m/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('ada10b875afb13d2b9440a5fa7116a7bd54fe9ef0c4aecf1c7d559c718f13251')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i '/fprintf.*stderr.*mn_wordlist_version/d' mnencode.c # remove a years-old deprecation warning
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 mnemonic.h "$pkgdir/usr/include/$pkgname/mnemonic.h"
	install -Dm644 mnemonic.o "$pkgdir/usr/lib/$pkgname/mnemonic.o"
	install -Dm755 mnencode "$pkgdir/usr/bin/mnencode"
	install -Dm755 mndecode "$pkgdir/usr/bin/mndecode"
}
