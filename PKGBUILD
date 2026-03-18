# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PEVANS
_dist=Net-Async-SOCKS
pkgname=perl-${_dist@L}
pkgver=0.003
pkgrel=1
pkgdesc='basic SOCKS5 connection support for IO::Async'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-future>=0.29'
    'perl-io-async>=0.62'
    'perl-parent'
    'perl-protocol-socks>=0.003'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-io'
    'perl-pathtools'
    'perl-test-checkdeps>=0.010'
    'perl-test-fatal>=0.010'
    'perl-test-hexstring'
    'perl-test-refcount>=0.07'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('24721a94ccedd15b05003eb3099a0d83a03dcfbbe2f86a75895bec8fed28be3e')

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
