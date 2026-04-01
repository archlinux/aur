# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=HAARG
_dist=Catalyst-Plugin-Session-State-Cookie
pkgname=perl-${_dist@L}
pkgver=0.18
pkgrel=1
pkgdesc='Maintain session IDs using cookies.'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-catalyst-plugin-session>=0.27'
    'perl-catalyst-runtime>=5.80005'
    'perl-moose'
    'perl-mro-compat'
    'perl-namespace-autoclean'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-catalyst-runtime'
    'perl-http-cookies'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e9b1c7b2b96c194f87a5f77e1449717077c70ffc67a4bfc29f026c9ee2e07bea')

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
