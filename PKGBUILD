# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=perl-moosex-getopt
pkgver=0.78
pkgrel=2
pkgdesc='A Moose role for processing command line options'
arch=('any')
url='https://metacpan.org/release/MooseX-Getopt'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
makedepends=('perl-module-build-tiny>=0.039')
depends=(
	'perl>=5.8.9'
	'perl-getopt-long-descriptive>=0.088'
	'perl-moose>=0.56'
	'perl-moosex-role-parameterized'
	'perl-try-tiny')
checkdepends=(
	'perl>=5.10.1'
	'perl-cpan-meta-check>=0.007'
	'perl-module-runtime'
	'perl-path-tiny>=0.009'
	'perl-test-checkdeps>=0.006'
	'perl-test-deep'
	'perl-test-fatal>=0.003'
	'perl-test-needs'
	'perl-test-trap'
	'perl-test-warnings'
	'perl-namespace-autoclean')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Getopt-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('6d0ace976fe24b98f7da3a93a4c4eb87')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
	cd MooseX-Getopt-$pkgver
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd MooseX-Getopt-$pkgver
	sanitize
	perl Build test
}

package() {
	cd MooseX-Getopt-$pkgver
	sanitize
	perl Build install

	# Remove this when https://bugs.archlinux.org/task/53770 will be fixed
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
