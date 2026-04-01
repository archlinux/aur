# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Contributor: Harley Pig <archlinux@harleypig.com>

_author=RSRCHBOY
_dist=MooseX-MarkAsMethods
pkgname=perl-${_dist@L}
pkgver=0.15
pkgrel=2
pkgdesc='Mark overload code symbols as methods'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('LGPL-2.1-only')
depends=(
    'perl-b-hooks-endofscope'
    'perl-moose'
    'perl-namespace-autoclean>=0.12'
    'perl>=5.6.0'
)
makedepends=('perl-extutils-makemaker>=6.30')
checkdepends=(
    'perl-file-temp'
    'perl-moose'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c9ecc13376d0ff7dba481977337c33ea74e5d266a428b6af31552a2919ef7ef8')

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
