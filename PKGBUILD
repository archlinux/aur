# Maintainer: Jan Tojnar <jtojnar@gmail.com>
pkgname=perl-test-file-contents
pkgver=0.23
pkgrel=1
pkgdesc='Test routines for examining the contents of files'
_dist=Test-File-Contents
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('perl_5')
depends=(
	'perl-digest-md5'
	'perl-text-diff'
	'perl'
)

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/$_dist-$pkgver.tar.gz")
sha512sums=('8fe830e755660b32f79a82b84b55702a6dd2bd62136c456325340646fe11e82b5603fb3063fcbad393edaf68cabf84da79103be5ef4a5cb6de84ad8463de46db')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install --installdirs=vendor --destdir="$pkgdir"
}
