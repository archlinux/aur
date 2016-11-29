# Maintainer: Bennett Piater <bennett at piater dot name>

pkgname=aursec
pkgver=0.0.5a
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
sha512sums=('b874bf42711b6cdc758ff57e312ec2471c35a88fde98082efcf544d8f2d46ac98f1d3e38d533de6b3fb4e9bea3fa3386a6fdceb8e1ec0f1043f9f0a830a80424')
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
