# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=aursec
pkgver=0.9
pkgrel=1
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
sha512sums=('05d886761a5a853ee7d7aad014641519ff987718b9dec34ca24afd6a0c48ae0d612774003f95e2b6633c0a4d8dee8b52d00a29d880c216cc19d57034818b2f35'
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
