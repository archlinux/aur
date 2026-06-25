# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=HAARG
_dist=Algorithm-C3
pkgname=perl-${_dist@L}
pkgver=0.11
pkgrel=4
pkgdesc='A module for merging hierarchies using the C3 algorithm'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp>=0.01'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('aaf48467765deea6e48054bc7d43e46e4d40cbcda16552c629d37be098289309')

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
