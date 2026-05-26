# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=BIGPRESH
_dist=Data-Censor
pkgname=perl-${_dist@L}
pkgver=0.04
pkgrel=1
pkgdesc='censor sensitive stuff in a data structure'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-2.0')
depends=(
    'perl-ref-util'
    'perl>=5.6.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('b713694b004362ba799baca9ee96a5d1c45a5e297711e3312f741ef511e2cc83')

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
