# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_dist='MooseX-NonMoose'
pkgname='perl-moosex-nonmoose'
pkgver=0.27
pkgrel=2
pkgdesc='easy subclassing of non-Moose classes'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-module-runtime'
    'perl-moose>=2.0'
    'perl-scalar-list-utils>=1.33'
    'perl-try-tiny'
    'perl>=5.8.0'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-base'
    'perl-moose'
    'perl-test-fatal'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('6fc7893b47a7db812a3c1fe8bb90d9c235143c6937251e570e27bdbd0d844ece')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
