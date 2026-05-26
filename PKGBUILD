# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Kars Wang <jaklsy AT gmail.com>

_author=JAWNSY
_dist=Math-Random-ISAAC-XS
pkgname=perl-${_dist@L}
pkgver=1.004
pkgrel=2
pkgdesc='C implementation of the ISAAC PRNG algorithm'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('LicenseRef-custom')
depends=('perl>=5.6.0')
makedepends=(
    'perl-extutils-cbuilder'
    'perl-extutils-parsexs'
    'perl-module-build>=0.2808_01'
    'perl-test-nowarnings>=0.084'
    'perl-test-simple'
)
optdepends=('perl-math-random-isaac')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9af790eb92d1c6330d33c6daa8decf8a9c5dcc87b81779d6b12e14b931c3b87b')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
