# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Berto Gomez <csberto at gmail dot com>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

_author=ALEXMV
_dist=Config-GitLike
pkgname=perl-${_dist@L}
pkgver=1.18
pkgrel=1
pkgdesc='git-compatible config file parsing'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-moo'
    'perl-moox-types-mooselike'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker>=6.59')
checkdepends=(
    'perl-test-exception'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f7ae7440f3adab5b9ff9aa57216d84fd4a681009b9584e32da42f8bb71e332c5')

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
