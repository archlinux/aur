# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_author=JKEENAN
_dist=Test-Vars
pkgname=perl-${_dist@L}
pkgver=0.017
pkgrel=1
pkgdesc='Detects unused variables in perl modules'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-extutils-manifest'
    'perl-io'
    'perl-parent'
    'perl-scalar-list-utils>=1.33'
    'perl-storable'
    'perl>=5.10.0'
)
makedepends=('perl-extutils-makemaker>=6.17')
checkdepends=(
    'perl-moose'
    'perl-pathtools'
    'perl-test-output'
    'perl-test-simple'
)
optdepends=(
    'perl-moose'
    'perl-test-output'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('56ddacbb663cf542673aa65525ef50980b53f207770e743a1d18614bd8268178')

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
