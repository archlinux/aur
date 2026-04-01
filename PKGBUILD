# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=MATTP
_dist=Test-WWW-Selenium
pkgname=perl-${_dist@L}
pkgver=1.36
pkgrel=1
pkgdesc='Perl Client for the Selenium Remote Control test tool'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-base'
    'perl-carp'
    'perl-data-dumper'
    'perl-exporter'
    'perl-http-message'
    'perl-io'
    'perl-libwww'
    'perl-namespace-clean'
    'perl-test-simple'
    'perl-time-hires'
    'perl-uri'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker>=6.30')
checkdepends=(
    'perl-file-temp'
    'perl-findbin'
    'perl-pathtools'
    'perl-test-exception'
    'perl-test-mock-lwp'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('ea93d97f6c0be0232f8b07ac0584dc3cd13e7a191dd03cca639ade02f44b3b69')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
