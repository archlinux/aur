# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Jie Zhu <alienchuj@gmail.com>

_dist='Devel-OverrideGlobalRequire'
pkgname='perl-devel-overrideglobalrequire'
pkgver=0.001
pkgrel=3
pkgdesc='Override CORE::GLOBAL::require safely'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl>=5.6')
checkdepends=(
    'perl-file-temp'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-test-simple'
)
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/$_dist-$pkgver.tar.gz")
sha256sums=('0791892de3ae292af4a94e382f21db1ee88210875031851e6ea82c3410785ef9')

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
