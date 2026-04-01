# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Milo Mirate <mmirate@gatech.edu>

_author=GWILLIAMS
_dist=RDF-Trine
pkgname=perl-${_dist@L}
pkgver=1.019
pkgrel=1
pkgdesc='An RDF Framework for Perl'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-algorithm-combinatorics'
    'perl-cache-lru'
    'perl-data-uuid'
    'perl-dbd-sqlite>=1.14'
    'perl-dbi'
    'perl-dbix-connector'
    'perl-digest-md5'
    'perl-digest-sha'
    'perl-error'
    'perl-http-negotiate'
    'perl-iri'
    'perl-json>=2'
    'perl-libwww'
    'perl-log-log4perl'
    'perl-math-bigint'
    'perl-module-load-conditional>=0.38'
    'perl-moose>=2'
    'perl-moosex-arrayref'
    'perl-scalar-list-utils>=1.24'
    'perl-set-scalar'
    'perl-storable'
    'perl-text-csv-xs'
    'perl-text-table'
    'perl-time-hires'
    'perl-uri>=1.52'
    'perl-xml-commonns>=0.04'
    'perl-xml-namespace'
    'perl-xml-sax>=0.96'
    'perl>=5.10.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-test-deep'
    'perl-test-exception'
    'perl-test-json'
    'perl-test-simple'
)
optdepends=(
    'perl-term-ansicolor'
    'perl-xml-libxml'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('1bb07daa10781738aeedd8e70156868c9a70fbd310f05f2ec1f6ea02d8697060')

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
