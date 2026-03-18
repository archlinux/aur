# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=PEVANS
_dist=Net-Async-HTTP
pkgname=perl-${_dist@L}
pkgver=0.50
pkgrel=2
pkgdesc='use HTTP with IO::Async'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=(
    'perl-future>=0.16'
    'perl-http-message'
    'perl-io-async'
    'perl-metrics-any>=0.05'
    'perl-scalar-list-utils>=1.29'
    'perl-socket>=2.010'
    'perl-struct-dumb>=0.07'
    'perl-time-hires'
    'perl-uri'
    'perl>=5.14.0'
)
makedepends=('perl-module-build>=0.4004')
checkdepends=(
    'perl-http-cookies'
    'perl-io-async'
    'perl-test-metrics-any'
    'perl-test-simple'
)
optdepends=(
    'perl-compress-raw-zlib'
    'perl-io-async-ssl: HTTPS support'
    'perl-net-async-socks: SOCKS5 support'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('92845b8ffdd2dc81decbe8a7b99203e4e34971de6624acb5c10aa9ff07885b87')

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
