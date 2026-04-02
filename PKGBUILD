# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ISHIGAKI
_dist=Data-Clone
pkgname=perl-${_dist@L}
pkgver=0.006
pkgrel=1
pkgdesc='Polymorphic data cloning'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-parent'
    'perl-xsloader>=0.02'
    'perl>=5.8.1'
)
makedepends=(
    'perl-devel-ppport>=3.19'
    'perl-extutils-makemaker>=6.59'
    'perl-extutils-parsexs>=3.18'
    'perl-module-build'
    'perl-module-build-xsutil'
    'perl-test-requires>=0.03'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('b8745954f0eff61efb25589cc13b4f2b1b26ce5ac3617d7e8aa3981626579629')

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
