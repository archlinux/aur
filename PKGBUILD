# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

_author=PEVANS
_dist=Test-Identity
pkgname=perl-${_dist@L}
pkgver=0.01
pkgrel=3
pkgdesc='assert the referential identity of a reference'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl'
    'perl-scalar-list-utils'
)
makedepends=(
    'perl-module-build>=0.36'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2f0205009aed152668182aafa16357ab1f47b4cbc001e89871b67387ef8e5f23')

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
