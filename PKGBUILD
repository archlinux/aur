# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Perl-Critic-Policy-Variables-ProhibitLoopOnHash'
pkgname='perl-perl-critic-policy-variables-prohibitlooponhash'
pkgver=0.009
pkgrel=1
pkgdesc="Don't write loops on hashes, only on keys and values of hashes"
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('MIT')
depends=(
    'perl'
    'perl-carp'
    'perl-perl-critic>=1.126'
    'perl-scalar-list-utils>=1.33'
)
checkdepends=(
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/X/XS/XSAWYERX/$_dist-$pkgver.tar.gz")
sha256sums=('ce4a334de0927fc45dcb35edfc81be6381528a528195b2f877304aa83d761ea5')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
