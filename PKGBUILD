# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=HAARG
_dist=Class-C3-Componentised
pkgname=perl-${_dist@L}
pkgver=1.001002
pkgrel=4
pkgdesc='Load mix-ins or components to your C3-based class'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-class-c3>=0.20'
    'perl-class-inspector>=1.32'
    'perl-mro-compat>=0.09'
    'perl>=5.6.2'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-exception>=0.31'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('3051b146dc1efeaea1a9a2e9e6b1773080995b898ab583f155658d5fc80b9693')

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
