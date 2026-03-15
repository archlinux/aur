# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=GUGOD
_dist=Hijk
pkgname=perl-${_dist@L}
pkgver=0.28
pkgrel=1
pkgdesc='Fast & minimal low-level HTTP client'
arch=('any')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('MIT')
depends=(
    'perl'
    'perl-time-hires'
)
makedepends=('perl-module-build-tiny')
checkdepends=(
    'perl-http-server-simple-psgi'
    'perl-net-ping>=2.41'
    'perl-net-server'
    'perl-plack'
    'perl-test-exception'
    'perl-test-simple'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('62f72c191b2b5ee55842a926fdec8c630ee663b32f0195644c45e435699bf03b')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
