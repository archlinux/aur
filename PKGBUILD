# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=perl-posix-strftime-compiler
pkgver=0.46
pkgrel=2
pkgdesc='GNU C library compatible strftime for loggers and servers'
arch=('any')
url='https://metacpan.org/dist/POSIX-strftime-Compiler'
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-module-build-tiny>=0.035')
source=(https://cpan.metacpan.org/authors/id/K/KA/KAZEBURO/POSIX-strftime-Compiler-0.46.tar.gz)
options=(!emptydirs)
md5sums=('e64777d20d363a1b47acf85774d108da')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
	cd POSIX-strftime-Compiler-0.46
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd POSIX-strftime-Compiler-0.46
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd POSIX-strftime-Compiler-0.46
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
