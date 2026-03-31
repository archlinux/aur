# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

_author=YVES
_dist=Carp-Assert
pkgname=perl-${_dist@L}
pkgver=0.22
pkgrel=5
pkgdesc='executable comments'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-exporter'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('807ea97c6bed76ac2e4969efba7dae48fefeb9f28797f112671b3ac8a49355f7')

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
