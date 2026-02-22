# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_dist='Crypt-IDEA'
pkgname='perl-crypt-idea'
pkgver=1.10
pkgrel=1
pkgdesc='Perl interface to IDEA block cipher'
arch=('any')
url="https://metacpan.org/dist/$_dist"
license=('custom')
depends=(
    'perl'
    'perl-carp'
    'perl-exporter'
)
makedepends=('perl-extutils-makemaker')
checkdepends=('perl-test-simple')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DP/DPARIS/$_dist-$pkgver.tar.gz")
sha256sums=('33bd78c11924a0fc1ff3eedde94078cbbf6b6ca9ede046d2b2f561e9e9a72019')

build()
{
    cd $_dist-$pkgver

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd $_dist-$pkgver

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
    install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
}
