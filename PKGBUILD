# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: xRemaLx <anton.komolov@gmail.com>

_author=ETHER
_dist=MooseX-Types-Path-Class
pkgname=perl-${_dist@L}
pkgver=0.09
pkgrel=2
pkgdesc='A Path::Class type library for Moose'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-if'
    'perl-moosex-types'
    'perl-path-class>=0.16'
    'perl>=5.6.0'
)
makedepends=('perl-module-build-tiny>=0.034')
checkdepends=(
    'perl-module-metadata'
    'perl-moose'
    'perl-pathtools'
    'perl-test-needs'
    'perl-test-simple'
    'perl>=5.6.0'
)
optdepends=(
    'perl-cpan-meta'
    'perl-moosex-getopt'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e784bab53698ae95a709a8663306145ffec55668df6cf31615333523fbe7ef7e')

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
