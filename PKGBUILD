# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=SKAJI
_dist=Module-cpmfile
pkgname=perl-${_dist@L}
pkgver=v1.0.0
pkgrel=1
pkgdesc='Parse cpmfile'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-cpan-meta'
    'perl-cpan-meta-requirements>=2.130'
    'perl-exporter>=5.57'
    'perl-scalar-list-utils'
    'perl-yaml-pp>=0.027'
    'perl>=5.24.0'
)
makedepends=('perl-module-build-tiny>=0.053')
checkdepends=(
    'perl-module-cpanfile>=1.1004'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('bd7fd447382bc34ec0197ece8cee4fcc6fd9b85ae72ecffd3649abe1b26928ad')

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
