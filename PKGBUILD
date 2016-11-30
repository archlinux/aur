# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=aursec
pkgver=0.0.6b
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
sha512sums=('8186bddd239699613b2829bc20daad9433563857af1729f0d19471d1b4e89ee590d1ebc66ddefe29c509e7ff44b98e5d30c370f21844d73d0a6f0bae2988f7fe')
validpgpkeys=('871F10477DB3DDED5FC447B226C7E577EF967808')
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
