# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Jie Zhu <alienchuj@gmail.com>

_dist='Class-Refresh'
pkgname='perl-class-refresh'
pkgver=0.07
pkgrel=2
pkgdesc='refresh your classes during runtime'
arch=('any')
url='https://metacpan.org/dist/Class-Refresh'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-carp'
    'perl-class-load'
    'perl-class-unload'
    'perl-devel-overrideglobalrequire'
    'perl-try-tiny'
)
checkdepends=(
    'perl-exporter'
    'perl-file-temp'
    'perl-test-fatal'
    'perl-test-requires'
    'perl-test-simple'
)
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/D/DO/DOY/$_dist-$pkgver.tar.gz")
sha256sums=('e3b0035355cbb35a2aee3f223688d578946a7a7c570acd398b28cddb1fd4beb3')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_OPT='NO_PACKLIST=1 NO_PERLLOCAL=1' PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL
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
