# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=XSAWYERX
_dist=HTTP-XSHeaders
pkgname=perl-${_dist@L}
pkgver=1.000100
pkgrel=1
pkgdesc='Fast XS Header library, replacing HTTP::Headers and HTTP::Headers::Fast.'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('MIT')
depends=(
    'perl-exporter>=5.57'
    'perl-http-date'
    'perl-http-message'
    'perl-xsloader'
    'perl>=5.8.9'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('e552786548c0f14c7aa435ac5c638ee6c8e2d5ecf74dbc4fa5b98f67d1840d4b')

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
