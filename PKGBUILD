# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=RIBASUSHI
_dist=DBIx-Class
pkgname=perl-${_dist@L}
pkgver=0.082844
pkgrel=4
pkgdesc='Extensible and flexible object <-> relational mapper.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-class-accessor-grouped>=0.10012'
    'perl-class-c3-componentised>=1.0009'
    'perl-class-inspector>=1.24'
    'perl-config-any>=0.20'
    'perl-context-preserve>=0.01'
    'perl-data-dumper-concise>=2.020'
    'perl-dbi>=1.57'
    'perl-devel-globaldestruction>=0.09'
    'perl-hash-merge>=0.12'
    'perl-module-find>=0.07'
    'perl-moo>=2.000'
    'perl-mro-compat>=0.12'
    'perl-namespace-clean>=0.24'
    'perl-path-class>=0.18'
    'perl-scope-guard>=0.03'
    'perl-sql-abstract-classic>=1.91'
    'perl-sub-name>=0.04'
    'perl-text-balanced>=2.00'
    'perl-try-tiny>=0.07'
    'perl>=5.8.1'
)
makedepends=(
    'perl-dbd-sqlite>=1.29'
    'perl-extutils-makemaker>=6.59'
    'perl-file-temp>=0.22'
    'perl-module-install'
    'perl-package-stash>=0.28'
    'perl-test-deep>=0.101'
    'perl-test-exception>=0.31'
    'perl-test-simple'
    'perl-test-warn>=0.21'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e0784e3861a197ad5aa17396f18901f0aaa8bab04a4330cb50038337ec30ca7f')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

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
