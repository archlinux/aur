# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=creduce
pkgver=2.10.0
pkgrel=3
epoch=
pkgdesc="A C/C++ program reducer"
arch=('i686' 'x86_64')
url="https://embed.cs.utah.edu/creduce/"
license=('custom:University of Illinois Open Source License')
depends=('astyle' 'clang>=9.0.0' 'indent' 'llvm>=9.0.0'
         'perl-benchmark-timer' 'perl-exporter-lite' 'perl-file-which'
         'perl-getopt-tabular' 'perl-regexp-common')
source=("https://embed.cs.utah.edu/$pkgname/$pkgname-$pkgver.tar.gz"
        '0001-Link-clang_delta-only-with-lclang-cpp-193.patch'
        '0002-Make-it-compile-with-LLVM11.patch')
md5sums=('ec9d5fd3c71840c7361cdf626fe1f202'
         '40d922b34f0d820ac61a8274093094ba'
         'df763f8f9a52bbdc8e8da6b574fd8d1b')
sha256sums=('db1c0f123967f24d620b040cebd53001bf3dcf03e400f78556a2ff2e11fea063'
            'eb5b1d38a35b2f6b74db49ce0e9d29b287694915d17941cdf1455cd34fe967df'
            '837c18c5d3cea9d51a52aeb5f191e00275b7f9ba09116b26a13f478d59f848bb')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-Link-clang_delta-only-with-lclang-cpp-193.patch"
	patch -p1 -i "$srcdir/0002-Make-it-compile-with-LLVM11.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/"
}
