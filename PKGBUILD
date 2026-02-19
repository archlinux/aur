# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='cpan-listchanges'
pkgname='perl-cpan-listchanges'
pkgver=0.08
pkgrel=1
pkgdesc='List changes for CPAN modules'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-algorithm-diff'
    'perl-cpan-distnameinfo'
    'perl-libwww'
    'perl-module-metadata'
    'perl-pod-usage'
    'perl-try-tiny'
    'perl-yaml'
    'perl>=5.8.1'
)
makedepends=('perl-module-build')
checkdepends=(
    'perl-test-requires'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/$_dist-$pkgver.tar.gz")
sha256sums=('70d3b77bede25cbf4368a9abe3e78ae4e5bb3aebddd3cce4fd3539df76ebf9ea')

build()
{
    cd $_dist-$pkgver

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
