# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DARREN
_dist=Text-TabularDisplay
pkgname=perl-${_dist@L}
pkgver=1.38
pkgrel=1
pkgdesc='Display text in formatted table output'
arch=('any')
url=https://metacpan.org/dist/$_dist
license=('GPL-2.0-only')
depends=('perl')
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('eb0990fafa56b667f23db764bdda5a4dc5f4b1ddc4b1383aa5eed6f22ed186e8')

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
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
