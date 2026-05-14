# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=JFREEMAN
_dist=Algorithm-LCSS
pkgname=perl-${_dist@L}
pkgver=0.01
pkgrel=1
pkgdesc='Perl extension for getting the Longest Common Sub-Sequence'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-algorithm-diff>=1.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('717cefcc7842a171ab5576f22eb72e566edf061ceaf87dccbe7f2081f5601f78')

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
