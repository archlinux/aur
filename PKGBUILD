# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Daniel Maurice Davis <daniel.maurice.davis@gmail.com>

_dist='File-DirCompare'
pkgname='perl-file-dircompare'
pkgver=0.7
pkgrel=2
pkgdesc='Perl module to compare two directories using callbacks'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-pathtools'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/G/GA/GAVINC/$_dist-$pkgver.tar.gz")
sha256sums=('b60e4d5dabc630fcfdcdf6f31fdcb6d277d3fd5375f02852eb4b51795a0b105b')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
