# CPAN Name  : Plack
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-plack
pkgver=1.0048
pkgrel=1
pkgdesc='Perl Superglue for Web frameworks and Web Servers'
arch=('any')
url='https://metacpan.org/release/Plack'
license=('PerlArtistic' 'GPL')

depends=(
	'perl>=5.10.1' # for Pod::Usage >= 1.36
	'perl-apache-logformat-compiler>=0.33'
	'perl-cookie-baker>=0.07'
	'perl-devel-stacktrace>=1.23'
	'perl-devel-stacktrace-ashtml>=0.11'
	'perl-file-sharedir>=1.00'
	'perl-filesys-notify-simple'
	'perl-http-entity-parser>=0.25'
	'perl-http-message>=5.814'
	'perl-http-headers-fast>=0.18'
	'perl-http-tiny>=0.034'
	'perl-hash-multivalue>=0.05'
	'perl-stream-buffered>=0.02'
	'perl-test-tcp>=2.15'
	'perl-try-tiny'
	'perl-uri>=1.59'
	'perl-www-form-urlencoded>=0.23')
makedepends=(
	'perl-extutils-makemaker>=6.30'
	'perl-file-sharedir-install>=0.06')
checkdepends=(
#	'perl-cgi-compile'
	'perl-http-request-ascgi'
	'perl-fcgi'
	'perl-fcgi-procmanager'
	'perl-http-server-simple-psgi'
	'perl-authen-simple-passwd'
	'perl-io-handle-util'
	'perl-log-dispatch-array'
	'perl-lwp-protocol-http10'
	'perl-mime-types')
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-1.0048.tar.gz)
options=(!emptydirs)
md5sums=('36282b473b4521219c44a9db437b650f')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Plack-1.0048
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Plack-1.0048
	sanitize
	make test
}

package() {
	cd Plack-1.0048
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
