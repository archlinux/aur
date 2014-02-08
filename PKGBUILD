# Contributor: Christian Sturm <reezer@reezer.org>

pkgname='perl-plack'
pkgver='1.0028'
pkgrel='2'
pkgdesc="Perl Superglue for Web frameworks and Web Servers (PSGI toolkit)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
	'perl>=5.8.1'
	'perl-apache-logformat-compiler'
	'perl-stream-buffered'
	'perl-devel-stacktrace>=1.23'
	'perl-devel-stacktrace-ashtml>=0.11'
	'perl-file-sharedir>=1.00'
	'perl-file-sharedir-install>=0,03'
	'perl-filesys-notify-simple'
	'perl-hash-multivalue>=0.05'
	'perl-http-body>=1.06'
	'perl-http-message>=5.814'
	'perl-libwww'
	'perl-try-tiny'
	'perl-uri>=1.59'
)
checkdepends=(
#	'perl-cgi-compile'
	'perl-http-request-ascgi'
	'perl-fcgi'
	'perl-fcgi-procmanager'
	'perl-http-server-simple-psgi'
	'perl-log-log4perl'
	'perl-authen-simple-passwd'
	'perl-io-handle-util'
	'perl-log-dispatch-array'
	'perl-lwp-protocol-http10'
	'perl-module-refresh'
	'perl-mime-types'
	'perl-test-requires'
	'perl-test-tcp>=0.11'
)
makedepends=('perl-extutils-makemaker>=6.59')
url='http://plackperl.org/'
source=("http://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/Plack-${pkgver}.tar.gz")
md5sums=('5acf30b426a8e2e354906ef93e3ad80b')
sha512sums=('dd55ad9a4e2b6af1b903920634afc81da542b531b28adb9b23281e17f6f7550ec31d79014d880e93b5513bc76b5829054f0a86af7dfa099eb5c15469b02eff91')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/Plack-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/Plack-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/Plack-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
