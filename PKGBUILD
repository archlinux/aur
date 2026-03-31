# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DROLSKY
_dist=Code-TidyAll
pkgname=perl-${_dist@L}
pkgver=0.85
pkgrel=1
pkgdesc='Engine for tidyall, your all-in-one code tidier and validator'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-base'
    'perl-capture-tiny'
    'perl-config-ini'
    'perl-constant'
    'perl-data-dumper'
    'perl-digest-sha'
    'perl-exporter'
    'perl-file-pushd'
    'perl-file-which'
    'perl-getopt-long'
    'perl-ipc-run3'
    'perl-ipc-system-simple'
    'perl-list-compare'
    'perl-list-someutils'
    'perl-log-any'
    'perl-module-runtime'
    'perl-moo'
    'perl-path-tiny>=0.098'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-scope-guard'
    'perl-specio'
    'perl-specio-library-path-tiny>=0.04'
    'perl-test-simple'
    'perl-text-diff'
    'perl-text-parsewords'
    'perl-time-duration-parse'
    'perl-timedate'
    'perl-try-tiny'
    'perl>=5.8.8'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-autodie'
    'perl-encode'
    'perl-extutils-makemaker'
    'perl-findbin'
    'perl-lib-relative'
    'perl-pathtools'
    'perl-test-class-most'
    'perl-test-differences'
    'perl-test-fatal'
    'perl-test-simple'
    'perl-test-warnings'
)
optdepends=(
    'perl-cpan-meta'
    'perl-parallel-forkmanager'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('b902d6cd3ba30426d53c5bb7844f7860ffc57849bea25f24fd7af87a80eb63c1')

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
