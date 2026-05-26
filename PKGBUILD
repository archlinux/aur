# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=GONZUS
_dist=HTTP-XSCookies
pkgname=perl-${_dist@L}
pkgver=0.000021
pkgrel=1
pkgdesc='Fast XS cookie mangling for Perl'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('MIT')
depends=(
    'perl-xsloader'
    'perl>=5.8.9'
)
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-data-dumper'
    'perl-test-simple'
    'perl-timedate'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('74e637d6f682f3025fbdf825f51c5be892a8458b5c6ae08c44a73cd8b658258a')

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
