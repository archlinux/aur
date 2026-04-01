# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=ETHER
_dist=Catalyst-Controller-ActionRole
pkgname=perl-${_dist@L}
pkgver=0.17
pkgrel=1
pkgdesc='(DEPRECATED) Apply roles to action instances'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-catalyst-runtime'
    'perl-class-load'
    'perl-moose'
    'perl-moosex-types'
    'perl-namespace-autoclean'
    'perl-scalar-list-utils'
    'perl-string-rewriteprefix>=0.004'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.039')
checkdepends=(
    'perl-catalyst-action-rest>=0.74'
    'perl-catalyst-runtime'
    'perl-extutils-makemaker'
    'perl-findbin'
    'perl-lib'
    'perl-moose'
    'perl-namespace-clean'
    'perl-parent'
    'perl-pathtools'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=('perl-cpan-meta')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('21f100392d5ff80d477a391786be28e26ab4ffa0ab3a2f6b74eee3e9803182b0')

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
