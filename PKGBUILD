# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=GETTY
_dist=SQL-Abstract
pkgname=perl-${_dist@L}
pkgver=2.000003
pkgrel=1
pkgdesc='Generate SQL from Perl data structures'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-exporter>=5.57'
    'perl-hash-merge>=0.12'
    'perl-moo>=2.000001'
    'perl-mro-compat>=0.12'
    'perl-scalar-list-utils'
    'perl-sub-quote>=2.000001'
    'perl-test-deep>=0.101'
    'perl-test-simple'
    'perl-text-balanced>=2.00'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-data-dumper-concise'
    'perl-storable'
    'perl-test-exception>=0.31'
    'perl-test-simple'
    'perl-test-warn'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('29713cb19949b420c1266a11630a9961552cd50943eaaff04c8b7aca44249592')

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
