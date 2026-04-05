# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

_author=HAARG
_dist=Catalyst-Action-RenderView
pkgname=perl-${_dist@L}
pkgver=0.17
pkgrel=3
pkgdesc='Sensible default end action.'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-catalyst-runtime>=5.80030'
    'perl-data-visitor>=0.24'
    'perl-mro-compat'
    'perl>=5.8.5'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-io'
    'perl-pathtools'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('71f6d5fd9f358611d1457c0c6b3fbe18224a4133e395e58d2a5ae4232f2761a5')

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
