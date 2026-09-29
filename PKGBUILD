# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: René Wagner
# Contributor: Christian Sturm <reezer@reezer.org>

_author=CHROMATIC
_dist=Modern-Perl
pkgname=perl-${_dist@L}
pkgver=1.20250607
pkgrel=2
pkgdesc='enable all of the features of Modern Perl with one import'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-io'
    'perl>=5.10.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('38ed7eb7b91aeed153887483e49a9a807a2e8962ab227cc6fdb5ea4dc41df128')

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
