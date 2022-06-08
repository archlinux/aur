# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.10.0.r94.4ae77d1
pkgrel=2
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=9.0.0' 'indent' 'llvm>=9.0.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common')
makedepends=('git')
source=('creduce::git+https://github.com/csmith-project/creduce.git#commit=4ae77d1e101135a6aea310b30c19e2af968b7bf6')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed -E 's/creduce-([^-]*)-([^-]*)-g/\1-r\2-/; s/-/./g'
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make install DESTDIR="$pkgdir/"
}
