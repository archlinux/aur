# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DROLSKY
_dist=MooseX-Configuration
pkgname=perl-${_dist@L}
pkgver=0.02
pkgrel=1
pkgdesc='Define attributes which come from configuration files'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-2.0')
depends=(
    'perl'
    'perl-autodie'
    'perl-config-ini'
    'perl-list-allutils'
    'perl-moose'
    'perl-moosex-types'
    'perl-moosex-types-path-class'
    'perl-namespace-autoclean'
    'perl-path-class'
    'perl-text-autoformat'
)
makedepends=('perl-extutils-makemaker>=6.31')
checkdepends=(
    'perl-file-temp'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('16a78ddcf36a79623b91be75507b760867ddf2ab6a108b44d39a01614422211f')

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
