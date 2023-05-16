# Maintainer: Frank Bearoff fbearoff at gmail dot com
# Contributor: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=trash-d
pkgver=19
pkgrel=1
pkgdesc="A near drop-in replacement for rm that uses the trash bin. Written in D"
arch=('x86_64')
url="https://github.com/rushsteve1/trash-d"
license=('GPL')
makedepends=(dmd dub ruby ruby-rake ruby-ronn-ng)
conflicts=("trash-cli")
source=("https://github.com/rushsteve1/trash-d/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('19b2170e1c49cc5124708a430c4b4bce6b550249e4bf600be53afa04bfb18f030a1a2604ed9a9cb531e594f51fd96fbe9c1febede832e2e11b78a6e0283b2b59')

build() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Build binary using Ruby Rake
	rake build:release

	# Build the manpage using Ruby Rake and Ronn
	rake manpage
}

check() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver"

	# Run the tests provided by the developer
	rake test
}

package() {
	# Enter the trash-d source folder downloaded from GitHub
	cd "$srcdir/$pkgname-$pkgver/build"

	# Install the produced binary
	install -Dm755 "./trash" "${pkgdir}/usr/bin/trash"

	# Install the manpage in the section #1
	install -Dm644 "./trash.man" "${pkgdir}/usr/share/man/man1/trash.1"
}
