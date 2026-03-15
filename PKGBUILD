# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_author=DPARIS
_dist=Crypt-IDEA
pkgname=perl-${_dist@L}
pkgver=1.10
pkgrel=2
pkgdesc='Perl interface to IDEA block cipher'
arch=('x86_64')
url=https://metacpan.org/release/DPARIS/$_dist-$_ver
license=('custom')
depends=(
    'perl'
    'perl-carp'
    'perl-exporter'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('33bd78c11924a0fc1ff3eedde94078cbbf6b6ca9ede046d2b2f561e9e9a72019')

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
