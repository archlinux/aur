# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DAGOLDEN
_dist=MooseX-Types-Stringlike
pkgname=perl-${_dist@L}
pkgver=0.003
pkgrel=1
pkgdesc='Moose type constraints for strings or string-like objects'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Apache-2.0')
depends=(
    'perl-moosex-types'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-moose'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-test-simple'
    'perl-version'
)
optdepends=(
    'perl-cpan-meta'
    'perl-cpan-meta-requirements'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2ee349ec5c529a6f347f42ff640e47b245564b93cca305df63c7821f5b55cf19')

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
