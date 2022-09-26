# Maintainer: Sean Anderson <seanga2@gmail.com>
_dist=Unicode-UTF8
pkgname=perl-unicode-utf8
pkgver=0.62
pkgrel=2
pkgdesc="Encoding and decoding of UTF-8 encoding form"
arch=(x86_64)
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=(
	perl-test-fatal
)
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHANSEN/$_dist-$pkgver.tar.gz")
sha512sums=('056026ac2ee4c101de5ea6017db59f875121dba8fd23ab5c2ae525effb8cf864e8a1c24588bb2a027792e27568742fc75bd5765694027b110afef867a4b982e0')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
