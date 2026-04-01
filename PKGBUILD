# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Milo Mirate <mmirate@gatech.edu>

_author=OVID
_dist=Test-JSON
pkgname=perl-${_dist@L}
pkgver=0.11
pkgrel=2
pkgdesc='Test JSON data'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-json-any>=1.2'
    'perl-test-differences>=0.47'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('07c08ab2fcc12850d1ad54fcf6afe9ad1a25a098310c3e7142af1d3cb821d7b3')

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
