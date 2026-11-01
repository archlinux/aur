# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Sean Anderson <seanga2@gmail.com>

_author=CHANSEN
_dist=Time-Moment
pkgname=perl-${_dist@L}
pkgver=0.46
pkgrel=1
pkgdesc='Represents a date and time of day with an offset from UTC'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-time-hires'
    'perl-xsloader>=0.02'
    'perl>=5.8.1'
)
makedepends=(
    'perl-extutils-makemaker>=6.59'
    'perl-extutils-parsexs>=3.18'
    'perl-module-install'
    'perl-test-fatal>=0.006'
    'perl-test-number-delta>=1.06'
    'perl-test-requires'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e1ec4c0b8bac451490f60ddb21b6e4849db49febb681e1cb04737e2d2731e5ad')

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
