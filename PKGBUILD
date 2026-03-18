# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PEVANS
_dist=IO-Async-SSL
pkgname=perl-${_dist@L}
pkgver=0.25
pkgrel=1
pkgdesc='use SSL/TLS with IO::Async'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-future>=0.33'
    'perl-io-async'
    'perl-io-socket-ssl>=2.003'
    'perl>=5.14.0'
)
makedepends=('perl-module-build>=0.4004')
checkdepends=(
    'perl-io-async'
    'perl-test-identity'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('4def485db1eff4e139b4b5912202c0fd61c3aed2cec35bd5ab8bf7bbd83f5a75')

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
