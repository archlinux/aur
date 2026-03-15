# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

_author=MAUKE
_dist=Function-Parameters
pkgname=perl-${_dist@L}
pkgver=2.002006
pkgrel=1
pkgdesc='define functions and methods with parameter lists ("subroutine signatures")'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-scalar-list-utils'
    'perl-xsloader'
    'perl>=5.14.0'
)
makedepends=(
    'perl-extutils-makemaker>=7.0'
    'perl-pathtools'
)
checkdepends=(
    'perl-constant'
    'perl-findbin'
    'perl-test-fatal'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('ec36c5d891f31a90a6b6d6198d983a5974603ad5eb4f9376af807ac37493f9a2')

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
