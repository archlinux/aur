# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=BRADFITZ
_dist=Unicode-CheckUTF8
pkgname=perl-${_dist@L}
pkgver=1.03
pkgrel=3
pkgdesc='checks if scalar is valid UTF-8'
arch=('x86_64')
url=https://metacpan.org/release/$_author/$_dist-$pkgver
license=('custom')
depends=(
    'perl'
    'perl-base'
    'perl-xsloader'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=(
    "https://cpan.metacpan.org/authors/id/B/BR/BRADFITZ/$_dist-$pkgver.tar.gz"
    'UPSTREAM_LICENSE'
)
sha256sums=(
    '97f84daf033eb9b49cd8fe31db221fef035a5c2ee1d757f3122c88cf9762414c'
    '15f522253458f367808fbafae5096f879e2b589c49cd0bc481847367a6f633b3'
)

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

    cd $srcdir
    install -Dm644 UPSTREAM_LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
