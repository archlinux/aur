# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=HAARG
_dist=Log-Contextual
pkgname=perl-${_dist@L}
pkgver=0.009001
pkgrel=1
pkgdesc='Simple logging interface with a contextual log'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-data-dumper-concise'
    'perl-moo>=1.003000'
    'perl-scalar-list-utils'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-io'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-needs'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e75687284bfe03b0e46bf9dc5306e65eed680708ec83e4a00fe29608b8fdcc91')

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
