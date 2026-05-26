# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: camb

_author=ARODLAND
_dist=CLI-Osprey
pkgname=perl-${_dist@L}
pkgver=0.09
pkgrel=1
pkgdesc='MooX::Options + MooX::Cmd + Sanity'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-getopt-long-descriptive>=0.100'
    'perl-module-runtime'
    'perl-moo'
    'perl-path-tiny'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-capture-tiny'
    'perl-test-lib'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('8549a09fdc97981298bd8f3aa2755294acaa7939ca279d3840bebc259a46844e')

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
