# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Hexchain Tong <i at hexchain dot org>

pkgname=tpm2-tools
pkgver=3.1.2
pkgrel=1
pkgdesc='TPM (Trusted Platform Module) 2.0 tools based on TPM2.0-TSS'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tools'
license=('BSD')
depends=('tpm2-tss>=2.0.0' 'curl')
checkdepends=('cmocka>=1.0.0')
optdepends=('tpm2-abrmd: user space resource manager to swap objects in and out of the limited TPM memory')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('80136c2b247b4d8cdd34b70960622ba22126150a286e49f3e77cda5fcef36294'
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
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
