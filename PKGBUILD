# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Sean Anderson <seanga2@gmail.com>

_author=CHANSEN
_dist=Unicode-UTF8
pkgname=perl-${_dist@L}
pkgver=0.75
pkgrel=1
pkgdesc='Encoding and decoding of UTF-8 encoding form'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-exporter'
    'perl-xsloader'
    'perl>=5.8.1'
)
makedepends=(
    'perl-devel-ppport'
    'perl-extutils-cbuilder'
    'perl-extutils-makemaker'
)
checkdepends=(
    'perl-encode>=1.9801'
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-fatal>=0.006'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta>=2.120900')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('55a990d3f939dca56e38d7070c53b413b513f701bff36ded0dd32f9840ccad53')

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
