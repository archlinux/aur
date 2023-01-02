# CPAN Name  : Plack
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=perl-plack
pkgver=1.0050
pkgrel=1
pkgdesc='Perl Superglue for Web frameworks and Web Servers'
arch=('any')
url='https://metacpan.org/release/Plack'
license=('PerlArtistic' 'GPL')

depends=(
	'perl'
	'perl-apache-logformat-compiler'
	'perl-cookie-baker'
	'perl-devel-stacktrace'
	'perl-devel-stacktrace-ashtml'
	'perl-file-sharedir'
	'perl-filesys-notify-simple'
	'perl-http-entity-parser'
	'perl-http-message'
	'perl-http-headers-fast'
	'perl-http-tiny'
	'perl-hash-multivalue'
	'perl-stream-buffered'
	'perl-test-tcp'
	'perl-try-tiny'
	'perl-uri'
	'perl-www-form-urlencoded')
makedepends=(
	'perl-extutils-makemaker'
	'perl-file-sharedir-install')
checkdepends=(
	'perl-cgi-compile'
	'perl-http-request-ascgi'
	'perl-fcgi'
	'perl-fcgi-procmanager'
	'perl-http-server-simple-psgi'
	'perl-authen-simple-passwd'
	'perl-io-handle-util'
	'perl-log-dispatch-array'
	'perl-lwp-protocol-http10'
	'perl-mime-types'
	'perl-log-log4perl'
	'perl-module-refresh'
	'perl-cgi-emulate-psgi')

source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('0856a900a981769e3d79f0a10ccc3e65')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Plack-$pkgver
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Plack-$pkgver
	sanitize
	make test
}

package() {
	cd Plack-$pkgver
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
