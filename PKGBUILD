# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=ETHER
_dist=MooseX-ConfigFromFile
pkgname=perl-${_dist@L}
pkgver=0.14
pkgrel=1
pkgdesc='An abstract Moose role for setting attributes from a configfile'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-carp'
    'perl-moose'
    'perl-moosex-types'
    'perl-moosex-types-path-tiny>=0.005'
    'perl-namespace-autoclean'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.007')
checkdepends=(
    'perl-extutils-makemaker'
    'perl-if'
    'perl-moose'
    'perl-pathtools'
    'perl-scalar-list-utils'
    'perl-test-deep'
    'perl-test-fatal'
    'perl-test-requires'
    'perl-test-simple'
    'perl-test-without-module'
    'perl>=5.6.0'
)
optdepends=(
    'perl-cpan-meta'
    'perl-moosex-getopt'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('9ad343cd9f86d714be9b54b9c68a443d8acc6501b6ad6b15e9ca0130b2e96f08')

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
