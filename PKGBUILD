# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.10.0.r100.1f1bfd7
pkgrel=1
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=16.0.5' 'indent' 'llvm>=16.0.5'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common')
makedepends=('git')
source=('creduce::git+https://github.com/csmith-project/creduce.git#commit=1f1bfd7fe4db251a3f70b8187eac6c14c89c91b9')
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
