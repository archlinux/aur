# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=GWILLIAMS
_dist=Attean
pkgname=perl-${_dist@L}
pkgver=0.034
pkgrel=1
pkgdesc='A Semantic Web Framework'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-algorithm-combinatorics'
    'perl-datetime-format-w3cdtf'
    'perl-exporter-tiny>=1'
    'perl-file-slurp'
    'perl-http-negotiate'
    'perl-iri>=0.005'
    'perl-json'
    'perl-libwww'
    'perl-list-moreutils'
    'perl-math-cartesian-product>=1.008'
    'perl-module-pluggable'
    'perl-moo>=2.000002'
    'perl-moose'
    'perl-moox-log-any'
    'perl-namespace-clean'
    'perl-perlio-layers'
    'perl-role-tiny>=2.000003'
    'perl-scalar-list-utils>=1.4'
    'perl-set-scalar'
    'perl-sub-install'
    'perl-test-modern>=0.012'
    'perl-test-roo'
    'perl-text-csv'
    'perl-text-table'
    'perl-try-tiny'
    'perl-type-tiny'
    'perl-uri-namespacemap>=0.12'
    'perl-uri>=1.36'
    'perl-uuid-tiny'
    'perl-xml-sax'
    'perl>=5.14.0'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-http-message'
    'perl-plack'
    'perl-regexp-common'
    'perl-test-exception'
    'perl-test-lwp-useragent'
    'perl-test-requires'
    'perl-test-simple'
    'perl-xml-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('536e07755ce5948acfe3d1982d76a1c10f0fc593ce8b607a3137406a42789d7b')

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
