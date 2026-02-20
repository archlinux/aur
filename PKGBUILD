# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Perl-Critic-Community'
_pkgver='v1.0.4'
pkgname='perl-perl-critic-community'
pkgver=1.04
pkgrel=1
pkgdesc='Community-inspired Perl::Critic policies'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('Artistic-2.0')
depends=(
    'perl-carp'
    'perl-exporter'
    'perl-path-tiny>=0.101'
    'perl-perl-critic-policy-plicease-prohibitarrayassignaref>=100.00'
    'perl-perl-critic-policy-variables-prohibitlooponhash>=0.005'
    'perl-perl-critic>=1.126'
    'perl-ppi>=1.254'
    'perl-scalar-list-utils>=1.33'
    'perl>=5.10.1'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-module-metadata'
    'perl-pathtools'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DB/DBOOK/$_dist-$_pkgver.tar.gz")
sha256sums=('3b31624ea0cf4392b8f4397a529515248814a2166697f1a453d58ab6f112d209')

build()
{
    cd $_dist-$_pkgver

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd $_dist-$_pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd $_dist-$_pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
