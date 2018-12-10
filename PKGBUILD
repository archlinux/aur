# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain dot org>
pkgname=tpm2-tss
pkgver=2.1.0
pkgrel=1
pkgdesc='Implementation of the Trusted Platform Module 2.0 Software Stack (TSS2)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('libgcrypt')
checkdepends=('cmocka' # for unit test suite
              'ibm-sw-tpm2' 'net-tools' 'procps-ng' 'uthash') # for integration test suite
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('2aea80a4cb2be59a87de6eda74a2907a2832aa76c3c208f610172f4c5bd29133b24b0876286c40855a742d6068b8f843e32f6d995b0e51c2d1e0a752b92fff7c'
            'SKIP')
validpgpkeys=('D760B790CCF0A41CBE7B047C316CC1FB24ABDC72') # Tadeusz Struk

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-unit --enable-integration
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
