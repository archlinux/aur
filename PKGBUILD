# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

_author=ILMARI
_dist=multidimensional
pkgname=perl-${_dist@L}
pkgver=0.014
pkgrel=2
pkgdesc='disables multidimensional array emulation'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-b-hooks-op-check'
    'perl-if'
    'perl-xsloader'
    'perl>=5.8.1'
)
makedepends=(
    'perl-cpan-meta>=2.112580'
    'perl-extutils-depends'
    'perl-extutils-makemaker'
    'perl-test-simple'
)
checkdepends=(
    'perl-extutils-makemaker'
    'perl-lib'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('12eb14317447bd15ab9799677db9eda20e784d8b113e44a5f6f11f529e862c5f')

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
