# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=SKAJI
_dist=CPAN-02Packages-Search
pkgname=perl-${_dist@L}
pkgver=v1.0.0
pkgrel=1
pkgdesc='Search packages in 02packages.details.txt'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-search-dict>=1.07'
    'perl-tie-handle-offset>=0.004'
    'perl>=5.24.0'
)
makedepends=('perl-module-build-tiny>=0.053')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('c953c6c919b53380f963fd774c15b798856b54b052a3bf31091f035611d0ce1b')

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
