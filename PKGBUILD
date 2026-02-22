# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_dist='CPAN-Mini'
pkgname='perl-cpan-mini'
pkgver=1.111017
pkgrel=2
pkgdesc='create a minimal mirror of CPAN'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-file-homedir>=0.57'
    'perl-file-path>=2.04'
    'perl-file-temp'
    'perl-getopt-long'
    'perl-io-compress>=1.20'
    'perl-libwww>=5'
    'perl-pathtools'
    'perl-pod-usage>=1.00'
    'perl-uri>=1'
    'perl>=5.12.0'
)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('f204293be26ac841acc87044a188db0f591e80881316c7a288aec0eece306155')

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
