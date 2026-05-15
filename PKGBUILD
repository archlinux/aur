# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=MBETHKE
_dist=Text-Levenshtein-Flexible
pkgname=perl-${_dist@L}
pkgver=0.10
pkgrel=1
pkgdesc='XS Levenshtein distance calculation with bounds and costs'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('(Artistic-1.0-Perl OR GPL-1.0-or-later) AND PostgreSQL')
depends=('perl>=5.8.8')
makedepends=('perl-extutils-makemaker')
checkdepends=(
    'perl-test-exception'
    'perl-test-leaktrace'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.bz2")
sha256sums=('adb367066b78c36f6ca63206021386ab1409c2da79d69ce7e4605e63e6a5e106')

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
    install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
