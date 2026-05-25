# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ISHIGAKI
_dist=Parse-LocalDistribution
pkgname=perl-${_dist@L}
pkgver=0.21
pkgrel=1
pkgdesc='parses local .pm files as PAUSE does'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-cpan-meta'
    'perl-parse-pmfile>=0.37'
    'perl-pathtools'
    'perl-scalar-list-utils'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-extutils-makemaker-cpanfile>=0.09'
)
checkdepends=(
    'perl-file-path'
    'perl-file-temp'
    'perl-test-simple'
    'perl-test-useallmodules>=0.10'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('779ea48113f968d98cf6727607d668b96e8ed98f82a26645daf77820e0ec0acc')

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
