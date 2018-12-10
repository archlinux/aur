# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>
pkgname=tpm2-tools
pkgver=3.1.3
pkgrel=1
pkgdesc='Trusted Platform Module 2.0 tools based on tpm2-tss'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('curl' 'tpm2-tss')
checkdepends=('cmocka')
optdepends=('tpm2-abrmd: user space resource manager to swap objects in and out of the limited TPM memory')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('37edf59e47168c42ffc66e948722753334ae3e00f3e258d9e801dffd259a763a1bf4f63b3feecf7728b4dade69ca5da15d631e1a606f68e10f7d314a1a757bdc'
            'SKIP')
validpgpkeys=('5B482B8E3E19DA7C978E1D016DE2E9078E1F50C1'  # William Roberts
              'D75ED7AA24E50CD645C6F457C751E590D63F3D69'  # Javier Martinez Canillas
              '5BEC526CE3A61CAF07E7A7DA49BCAE5443FFFC34') # Joshua Lock

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-unit
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
