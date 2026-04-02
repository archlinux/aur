# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=ETHER
_dist=MooseX-Types-Common
pkgname=perl-${_dist@L}
pkgver=0.001015
pkgrel=1
pkgdesc='A library of commonly used type constraints'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-if'
    'perl-moose'
    'perl-moosex-types'
    'perl>=5.6.1'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-module-metadata'
    'perl-pathtools'
    'perl-term-ansicolor'
    'perl-test-deep'
    'perl-test-simple'
    'perl-test-warnings>=0.005'
    'perl>=5.8.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2b30e20b325133bbafe907a62b4c87f77ca61bbaa117022ac56af94e2835a313')

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
