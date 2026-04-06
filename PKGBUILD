# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: chimeracoder <dev@chimeracoder.net>

_author=ETHER
_dist=MooseX-LazyRequire
pkgname=perl-${_dist@L}
pkgver=0.11
pkgrel=3
pkgdesc='Required attributes which fail only when trying to use them'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-aliased>=0.30'
    'perl-carp'
    'perl-moose'
    'perl-namespace-autoclean'
    'perl>=5.6.0'
)
makedepends=(
    'perl-extutils-makemaker'
    'perl-module-build-tiny>=0.037'
)
checkdepends=(
    'perl-extutils-makemaker'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('ef620c1e019daf9cf3f23a943d25a94c91e93ab312bcd63be2e9740ec0b94288')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MB_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

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
