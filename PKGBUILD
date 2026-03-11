# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Contributor: Harley Pig <archlinux@harleypig.com>

_dist=MooseX-NonMoose
_ver=0.27
pkgname=perl-${_dist,,}
pkgver=${_ver#v}
pkgrel=4
pkgdesc='easy subclassing of non-Moose classes'
arch=('any')
url=https://metacpan.org/release/PLICEASE/$_dist-$_ver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-module-runtime'
    'perl-moose'
    'perl-scalar-list-utils'
    'perl-try-tiny'
    'perl>=5.8.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl>=5.6.0'
)
checkdepends=(
    'perl-base'
    'perl-moose'
    'perl-test-fatal'
    'perl-test-simple'
    'perl>=5.8.0'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$_ver.tar.gz")
sha256sums=('6fc7893b47a7db812a3c1fe8bb90d9c235143c6937251e570e27bdbd0d844ece')

build()
{
    cd "$_dist-$_ver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$_ver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
