# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=HAARG
_dist=MooX-TypeTiny
pkgname=perl-${_dist@L}
pkgver=0.002003
pkgrel=1
pkgdesc='Optimized type checks for Moo + Type::Tiny'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-moo>=2.004'
    'perl-type-tiny>=1.008'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-fatal>=0.003'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('d81e26ff6f8db10261f0087f96dc54367dcb49a9f3de8d53238f834ece19624b')

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
