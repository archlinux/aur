# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=2.0.0
pkgrel=3
pkgdesc='TPM (Trusted Platform Module) 2.0 Software Stack (TSS)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('libgcrypt')
makedepends=('cmocka>=1.0.0')
source=("https://github.com/tpm2-software/tpm2-tss/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('7dfd05f7d2c4d5339d1c9ecbdba25f4ea6df70e96b09928e15e0560cce02d525' 'SKIP')
validpgpkeys=('42007E876F248E04A3F2FE25AE4548D043DEC7C3')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-unit --disable-static --disable-doxygen-doc --with-pic
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
