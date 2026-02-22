# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

_dist='Devel-CheckBin'
pkgname='perl-devel-checkbin'
pkgver=0.04
pkgrel=13
pkgdesc='check that a command is available'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-exporter'
    'perl-extutils-makemaker>=6.52'
    'perl-parent'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker>=6.64')
checkdepends=(
    'perl-file-temp'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/$_dist-$pkgver.tar.gz")
sha256sums=('157f3db59c29ed1d49133a469cee772c885ad4ee64e8692a91b3ebfdbe2fe3e4')

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
