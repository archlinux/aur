# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
# Contributor: Frank Bearoff fbearoff at gmail dot com
# Contributor: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
pkgver=20
pkgrel=2
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('MIT')
makedepends=(dub dmd scdoc)
conflicts=("trash-cli")
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('86519a0ea3524f4d80ca2bfce2b34de029fc0d786556a99c19be0fe6d48f8a4b640b96a93c2f063e2de52b3783975b0d422662d9474ad175743b3a759183237f')

build() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Build using dub
	dub build --build=release
	
	# Build the manpage using scdoc
	scdoc < MANUAL.scd > ./build/trash.man
}

check() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Run the tests provided by the developer
	dub test
}

package() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver/build"

	# Install the produced binary
	install -Dm755 "./trash" "${pkgdir}/usr/bin/trash"
	
	# Install the manpage in the section #1
	install -Dm644 "./trash.man" "${pkgdir}/usr/share/man/man1/trash.1"
}

