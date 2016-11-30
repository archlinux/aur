# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=aursec
pkgver=0.0.6a
pkgrel=1
pkgdesc='Verify AUR package sources against hashes stored in a blockchain.'
arch=('x86_64' 'x86' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/clawoflight/$pkgname"
license=('custom:MPL2')

depends=(firejail geth vim)
makedepends=(pandoc)
checkdepends=(shellcheck)
#optdepends=()

#changelog="CHANGELOG"
source=($pkgname-$pkgver.tar.gz::https://github.com/clawoflight/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('a8ea7a888576e4d7fc85e6af839a114f6e6939f6c319a266bd29698cdf007465bb3ff1d2f89965fb9f9db90c0d427255dedb421104ba5dfee036550aeca5ba61')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')
install=aursec.install

build() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/aursec"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
