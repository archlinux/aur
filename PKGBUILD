# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=ETHER
_dist=Carp-REPL
pkgname=perl-${_dist@L}
pkgver=0.18
pkgrel=1
pkgdesc='read-eval-print-loop on die and/or warn'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-data-dump-streamer'
    'perl-devel-lexalias'
    'perl-devel-repl'
    'perl-devel-stacktrace-withlexicals'
    'perl-lexical-persistence'
    'perl-namespace-autoclean'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-expect'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('78afef4ebdd3fd3848c60839cabe0766a8cbf419a29e6a80246c5752fb17d1a7')

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
