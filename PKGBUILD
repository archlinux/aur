# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: C. Dominik Bódi <domimik dot bodi at gmx dot de>

_author=ILMARI
_dist=bareword-filehandles
pkgname=perl-${_dist@L}
pkgver=0.007
pkgrel=1
pkgdesc='disables bareword filehandles'
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
    'perl-extutils-depends'
    'perl-extutils-makemaker'
    'perl-test-simple'
)
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4134533716d87af8fff56e250c488ad06df0a7bff48e7cf7de63ff6bc8d9c17f')

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
