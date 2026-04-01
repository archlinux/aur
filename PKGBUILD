# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DAGOLDEN
_dist=Test-Roo
pkgname=perl-${_dist@L}
pkgver=1.004
pkgrel=1
pkgdesc='Composable, reusable tests with roles and Moo'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Apache-2.0')
depends=(
    'perl-moo>=1.000008'
    'perl-moox-types-mooselike'
    'perl-strictures'
    'perl-sub-install'
    'perl-test-simple'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-capture-tiny>=0.12'
    'perl-extutils-makemaker'
    'perl-file-temp'
    'perl-lib'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=(
    'perl-bareword-filehandles'
    'perl-cpan-meta'
    'perl-indirect'
    'perl-multidimensional'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('21129a3cecb507b00948e16cf15fcde5dc4db235aba84afd7f47d22013a9ded6')

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
