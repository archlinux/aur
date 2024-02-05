# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Contributor: Elias Elwyn <a@jthv.ai>

pkgname=perl-plack
pkgver=1.0051
pkgrel=1
pkgdesc='Perl Superglue for Web frameworks and Web Servers'
_dist=Plack
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
depends=(
	'perl'
	'perl-apache-logformat-compiler'
	'perl-cookie-baker'
	'perl-devel-stacktrace'
	'perl-devel-stacktrace-ashtml'
	'perl-file-sharedir'
	'perl-filesys-notify-simple'
	'perl-hash-multivalue'
	'perl-http-entity-parser'
	'perl-http-headers-fast'
	'perl-http-message'
	'perl-stream-buffered'
	'perl-test-tcp'
	'perl-try-tiny'
	'perl-uri'
	'perl-www-form-urlencoded'
)
makedepends=(
	'perl-file-sharedir-install'
)
checkdepends=(
	'perl-authen-simple-passwd'
	'perl-cgi-compile'
	'perl-cgi-emulate-psgi'
	'perl-fcgi'
	'perl-fcgi-procmanager'
	'perl-http-request-ascgi'
	'perl-io-handle-util'
	'perl-log-dispatch'
	'perl-log-dispatch-array'
	'perl-lwp-protocol-http10'
	'perl-mime-types'
	'perl-module-refresh'
)
source=("https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/$_dist-$pkgver.tar.gz")
options=('!emptydirs' purge)
sha256sums=('bebde91c42298ed6ec8e6c82b21433a1b49aa39412c247f3905b80f955acf77b')

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
