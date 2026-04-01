# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=MooseX-Types-LoadableClass
pkgname=perl-${_dist@L}
pkgver=0.016
pkgrel=1
pkgdesc='ClassName type constraint with coercion to load the class.'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-if'
    'perl-module-runtime'
    'perl-moosex-types'
    'perl-namespace-autoclean'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-class-load'
    'perl-lib'
    'perl-module-metadata'
    'perl-moose'
    'perl-namespace-clean>=0.19'
    'perl-pathtools'
    'perl-term-ansicolor'
    'perl-test-fatal'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=(
    'perl-cpan-meta'
    'perl-json-pp'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('f105b69bcb44cd9856edfd62753ff58c35519ffa96e17cfc9ef30bdb98994ccc')

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
