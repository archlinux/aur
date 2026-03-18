# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: éclairevoyant

_author=PEVANS
_dist=Metrics-Any
pkgname=perl-${_dist@L}
pkgver=0.10
pkgrel=1
pkgdesc='abstract collection of monitoring metrics'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-scalar-list-utils>=1.29'
    'perl>=5.14.0'
)
makedepends=('perl-module-build>=0.4004')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('a90eadf9c8af24a516bb9a1b67061f641853f90b8fee9ffc24d2bb9720e8b99b')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null

    /usr/bin/perl Build.PL --create_packlist=0
    ./Build
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    ./Build install --installdirs=vendor --destdir="$pkgdir"
}
