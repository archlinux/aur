# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tools
pkgver=3.1.1
pkgrel=1
pkgdesc='TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('tpm2-tss>=2.0.0' 'curl')
checkdepends=('cmocka>=1.0.0')
optdepends=('tpm2-abrmd')
source=("https://github.com/tpm2-software/tpm2-tools/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c7f0cdca51ef2006503f60c462b6d183c9b9dc038f4c3f74a89c111088fed8aa')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-unit --disable-static --with-pic
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
