# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Moritz Bunkus <moritz@bunkus.org>

_author=RJBS
_dist=Email-Stuffer
pkgname=perl-${_dist@L}
pkgver=0.020
pkgrel=4
pkgdesc='A more casual approach to creating and sending Email:: emails'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-email-mime'
    'perl-email-sender'
    'perl-module-runtime'
    'perl-params-util>=1.05'
    'perl-scalar-list-utils'
    'perl>=5.12.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-email-sender>=0.120000'
    'perl-extutils-makemaker'
    'perl-moo'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta>=2.120900')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('0a1efb7f2dedd39052b126f718ca2d3b5845a4123a39392fd9dfa0c76e6057c7')

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
