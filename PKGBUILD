# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=aursec
pkgver=0.9
pkgrel=2
pkgdesc='Verify AUR package sources against hashes stored in a blockchain.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/clawoflight/$pkgname"
license=('custom:MPL2')

depends=(bc firejail geth vim)
makedepends=(pandoc)
checkdepends=(shellcheck)
#optdepends=()

#changelog="CHANGELOG"
source=(https://github.com/clawoflight/aursec/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz{,.asc})
sha512sums=('6cdc05801def3295df5dc6bc0d0a87ed3dcae7dc4f9b640150f2b2d5f773d8a20ac9ea9e47e93bc5133230e3a549670e51400f6cabbea62b4153587e19157a5a'
            'SKIP')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808'
	          'EF685CFEA6460909C7E1EE70A3BD44B344AAE1FD')
install=aursec.install

build() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
