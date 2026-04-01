# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Anonymous

_author=TOBYINK
_dist=MooseX-ArrayRef
pkgname=perl-${_dist@L}
pkgver=0.005
pkgrel=1
pkgdesc='blessed arrayrefs with Moose'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-moose>=2.00'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('8f2180abcbc110bedd9182e4ea3e7852df15f39ae49dc3dadd020b081ffcea08')

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
