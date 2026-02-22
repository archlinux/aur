# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Andrew Shark <ashark at linuxcomp dot ru>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_dist='Test-Portability-Files'
pkgname='perl-test-portability-files'
pkgver=0.10
pkgrel=2
pkgdesc='Check file names portability'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-file-temp>=0.2304'
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/A/AB/ABRAXXA/$_dist-$pkgver.tar.gz")
sha256sums=('08e4b432492dc1b44b55d5db57952eb76379c7f434ee8f16aca64d491f401a16')

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
