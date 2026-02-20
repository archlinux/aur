# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Perl-Critic-Policy-Plicease-ProhibitArrayAssignAref'
pkgname='perl-perl-critic-policy-plicease-prohibitarrayassignaref'
pkgver=100.00
pkgrel=1
pkgdesc="Don't assign an anonymous arrayref to an array"
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('GPL-3.0-only')
depends=(
    'perl>=5.6.0'
    'perl-perl-critic'
)
checkdepends=(
    'perl-perl-critic'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('d8b73230d2b8bf2b80104fc0a758c748b9ff37b08bf81baa73f8d709e20cfebe')

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
