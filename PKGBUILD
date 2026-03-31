# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=MooseX-Types-Path-Tiny
pkgname=perl-${_dist@L}
pkgver=0.012
pkgrel=1
pkgdesc='Path::Tiny types and coercions for Moose'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Apache-2.0')
depends=(
    'perl-if'
    'perl-moose>=2'
    'perl-moosex-getopt'
    'perl-moosex-types'
    'perl-moosex-types-stringlike'
    'perl-namespace-autoclean'
    'perl-path-tiny'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-file-pushd'
    'perl-file-temp>=0.18'
    'perl-module-metadata'
    'perl-pathtools'
    'perl-test-fatal'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('19eede02dd654e70f73e34cd7af0063765173bcaefeeff1bdbe21318ecfd9158')

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
